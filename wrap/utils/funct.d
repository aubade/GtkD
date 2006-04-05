/*
 * This file is part of duit.
 * 
 * duit is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 * 
 * duit is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with duit; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

module utils.funct;

//debug = Funct;
//debug = wrapType;
//debug = unwrapType;
//debug = mainStrct;
//debug = ctor;
//debug = type;
//debug = name;
//debug = parm;
//debug = externalDec
//debug = callback;

public struct Funct
{

	private import std.string;
	private import std.stdio;
	
	private import utils.convparms;
	private import utils.DuitClass;

	bit ctor;	/// when true this method was found to be a constructor
	char[] type;
	char[] typeWrap;
	char[] name;
	char[] convName;		/// name after convertion
	// TODO parms need to be a struct
	char[][] parmsType;
	char[][] parmsWrap;		/// this is the parameter wrapped type
	char[][] parms;
	char[][] parmsDesc;
	bit[] parmConst;
	bit[] parmPointer;
	char[] typeDesc;
	char[] strctVar;
	char[] strctPointer;
	
	
	/**
	 * Gets the type, name and parameters of the function
	 * Params:
	 *    	text = 	The Gtk API description of the function call
	 */
	void init(char[] text, ConvParms* convParms)
	{
		strctVar = null;
		getStrctVar(convParms);
		strctPointer = convParms.strct.dup ~ '*';
		debug(Funct) writefln("init text=%s", text);
		int p = 0;
		DuitClass.skipBlank(p,text);
		type = DuitClass.untilBlank(p, text);
		debug(type)writef("type = %s", type);
		DuitClass.fixType(type, p, text);
		debug(type)writefln(" -> %s", type);
		DuitClass.skipBlank(p, text);
		name = DuitClass.until(p, text, '(');

		DuitClass.adjustTypeName(type, name);

		typeWrap = getWrappedType(type.dup, convParms);
		
		DuitClass.skip(p, text,'(');
		int countBrace = 0;
		char[] currParmType;
		char[] currParm;
		debug(parm)writef("%s:", name);
		while ( countBrace==0 && p<text.length && text[p]!=')' )
		{
			currParmType.length = 0;
			currParm.length = 0;
			
			DuitClass.skipBlank(p, text);
			currParmType = DuitClass.untilBlank(p, text, ",)");
			DuitClass.skipBlank(p, text);
			debug(parm)writef("currParmType = %s", currParmType);
			if ( std.string.find(" const volatile G_CONST_RETURN ", currParmType) > 0 )
			{
				currParmType = DuitClass.untilBlank(p, text, ",)");
				DuitClass.skipBlank(p, text);
			}
			if ( "struct"==currParmType )
			{
				currParmType = DuitClass.untilBlank(p, text, ",)");
				DuitClass.skipBlank(p, text);
				currParmType = "void";
			}
			else
			{
				DuitClass.fixType(currParmType, p, text);
			}
			debug(parm)writefln(" -> %s", currParmType);
			if ( currParmType != "..." )
			{
				currParm = DuitClass.until(p, text, "),");
			}
			else
			{
				currParm = "";
			}
			
			DuitClass.adjustTypeName(currParmType, currParm);

			parmsType ~= currParmType.dup;
			parmsWrap ~= getWrappedType(currParmType.dup, convParms);
			parms ~= currParm.dup;
			
			if ( p<text.length && text[p]==',') ++p;
		}
		DuitClass.skip(p, text, ';');
	}

	char[] getStrctVar(ConvParms* convParms)
	{
		if ( strctVar.length == 0 )
		{
			if ( convParms.strct.length > 0 )
			{
				strctVar = DuitClass.toVar(convParms.strct.dup);
			}
			else
			{
				strctVar = "";
			}
		}
		return strctVar;
	}
	
	/**
	 * Checks the type against the strcutWrap table
	 * Returns: 
	 */
	char[] getWrappedType(char[] currType, ConvParms* convParms)
	{
		char[] wType;
		if ( currType == "gchar*" || currType == "char*" )
		{
			wType = "char[]";
		}
		else if ( convParms.structWrap.length == 0 )
		{
			// this should be the common case
			wType = currType;
		}
		else if ( currType in convParms.structWrap )
		{
			wType = convParms.structWrap[currType];
			debug(wrapType) writefln("WrappedType %s -> %s", currType, wType);
		}
		else
		{
			wType = currType;
		}
		
		debug(wrapType)writefln("\t wrapType: %s -> %s", currType, wType);
		return wType;
	}
	
	/**
	 * Gets the gtk from the Duit class to be used on the Gtk function call
	 * Params:
	 *    	currType = 	
	 *    	convParms = 	
	 * Returns: 
	 */
	char[] getUnwrappedType(char[] currType, ConvParms* convParms)
	{
		// TODO
		return currType;
	}

	/**
	 * Gets the external declaration
	 * Params:
	 *    	 = 	
	 *    	aliases = 	
	 * Returns: 
	 */
	char[] getExternal(ConvParms* convParms, char[][char[]] aliases)
	{
		
		char[] ext = type 
					~ " function(" 
					~ getParameters(convParms, aliases)
					~ ")" 
					~ name
					;
		
		return ext;
	}
	
	char[] getParameters(ConvParms* convParms, char[][char[]] aliases)
	{
		char[] parameters;
		
		int i=0;
		while ( i<parmsType.length && i< parms.length )
		{
			
			if ( i>0 ) parameters ~= ", ";
			if ( i>=0 
				&& (parmsType[i]!="void" || parms[i].length>0)
				)
			{
				parameters ~= parmsType[i] ~" "~DuitClass.idsToDuit(parms[i], convParms, aliases);
			}
			++i;
		}

		return parameters;
	}

	/**
	 * Gets the parameters for the call back functions.
	 * These are all but the first parameter and the last parameter will be the class.
	 * I'm not sure ths is valid for all callbacks.
	 * Params:
	 *    	convParms = 	
	 *    	aliases = 	
	 * Returns: 
	 */
	char[] getCallbackParameters(int firstParameter, ConvParms* convParms, char[][char[]] aliases)
	{
		char[] parameters;

		debug(callback)writefln("getCallbackParameters "~convParms.clss);
		debug(callback)writefln("\t %s", getExternal(convParms, aliases));
		
		int i=firstParameter;
		while ( i<parmsType.length && i< parms.length )
		{
			
			if ( i>firstParameter ) parameters ~= ", ";
			if ( i == parms.length-1 )
			{
				parameters ~= convParms.clss~" "~DuitClass.getClassVar(convParms);
			}
			else if ( i>=firstParameter
				&& (parmsType[i]!="void" || parms[i].length>0)
				)
			{
				if ( i == 0 && DuitClass.endsWith(parmsType[i], '*') )
				{
					parameters ~= parmsType[i] ~" "~DuitClass.idsToDuit(parms[i], convParms, aliases)~"Struct";
				}
				else
				{
					parameters ~= parmsType[i] ~" "~DuitClass.idsToDuit(parms[i], convParms, aliases);
				}
			}
			++i;
		}

		return parameters;
	}
	
	/**
	 * Gets the actual parameters for the call back functions.
	 * These are all but the first parameter and the last parameter will be the class.
	 * I'm not sure ths is valid for all callbacks.
	 * Params:
	 *    	convParms = 	
	 *    	aliases = 	
	 * Returns: 
	 */
	char[] getCallbackVars(ConvParms* convParms, char[][char[]] aliases)
	{
		char[] parameters;

		debug(callback)writefln("getCallbackVars "~convParms.clss);
		debug(callback)writefln("\t %s", getExternal(convParms, aliases));
		
		int i=1;
		while ( i<parmsType.length && i< parms.length )
		{
			
			if ( i>1 ) parameters ~= ", ";
			if ( i == parms.length-1 )
			{
				parameters ~= DuitClass.getClassVar(convParms);
			}
			else if ( i>=1 
				&& (parmsType[i]!="void" || parms[i].length>0)
				)
			{
				//if ( parmsType[i]=="GtkWidget*" )
				//{
				//	parameters ~= "new Widget("~DuitClass.idsToDuit(parameterToDuit(i, convParms, aliases), convParms, aliases)~")";
				//}
				//else
				{
					//parameters ~= DuitClass.idsToDuit(parameterToDuit(i, convParms, aliases), convParms, aliases);
					parameters ~= parameterToDuit(i, convParms, aliases);
				}
			}
			++i;
		}

		return parameters;
	}

	char[] getDelegateDeclaration(ConvParms* convParms, int firstParameter = 0)
	{
		if ( DuitClass.endsWith(typeWrap,"user_function") )
		{
			typeWrap = typeWrap[0..typeWrap.length-13];
		}
		char[] decl = typeWrap ~ " delegate(";
		
		int pCount = 0;
		foreach(int count, char[] parm ; parmsWrap )
		{
			if ( count >= firstParameter )
			{
				if ( pCount > 0 )
				{
					decl ~= ", ";
				}
				if ( count == parmsWrap.length-1 )
				{
					decl ~= convParms.clss;
				}
				else
				{
					decl ~= parm;
				}
				++pCount;
			}
		}
		decl ~= ")";
		return decl;
	}
	

	/**
	 * Gets the method header.
	 * If the type is a pointer to the main strcut and the name starts with "new"
	 * then the method is a constructor
	 * Params:
	 *    	strct = 	
	 * Returns: 
	 */
	char[] declaration(ConvParms* convParms, char[][char[]] aliases)
	{
		char[] dec;
		debug(ctor)writefln("declaration ctor strct = %s",convParms.strct);
		debug(ctor)writefln("declaration ctor type = %s",type);
		debug(ctor)writefln("declaration ctor name = %s",name);
		convName = DuitClass.idsToDuit(name, convParms, aliases);
		if ( convParms.strct.length>0 
			&& (type == strctPointer 
				|| /* special GObject case */
					(type == "gpointer" && convParms.strct == "GObject")
				|| /* special Gtk... that return a GtkWidget pointer */
					(type == "GtkWidget*")
				|| /* special Gtk... that return a GtkWidget pointer */
					(type == "GtkObject*" && convParms.strct == "GtkAdjustment")
				) 
			&& DuitClass.startsWith(convName, "new")
			)
		{
			dec = "public this (";
			ctor = true;
			convName = "this";
		}
		else
		{
			if ( convName == "new" )
			{
				convName ~= convParms.outFile;
			}
			if ( convParms.strct.length>0 
				&& parmsType.length > 0 
				&& (parmsType[0] == strctPointer )
				)
			{
				dec = "public "~typeWrap~" "~convName~"(";
			}
			else
			{
				dec = "public static "~typeWrap~" "~convName~"(";
			}
			ctor = false;
		}
		int i=0;
		int parmCount = 0;
		while ( i<parmsType.length && i< parms.length )
		{
			if ( i == 0 )
			{
				debug(mainStrct)writefln("1st Parm %s ?= %s",parmsType[i], convParms.strct);
				if ( parmsType[i] == strctPointer )
				{
					debug(mainStrct)writefln("\tSAME <<<<<<------");
					--parmCount;
				}
			}
			
			
			if ( parmCount>0 ) dec ~= ", ";
			if ( parmCount>=0 
				&& (parmsType[i]!="void" || parms[i].length>0)
				)
			{
				dec ~= parmsWrap[i]~" "~DuitClass.idsToDuit(parms[i], convParms, aliases);
			}
			++i;
			++parmCount;
		}
		dec ~= ')';
		
		return dec;
	}

	/**
	 * Wraps the parameters if necessary
	 * Params:
	 *    	i = 	
	 * Returns: 
	 */
	char[] parameterToGtk(int i, ConvParms* convParms, char[][char[]] aliases)
	{
		char[] parmToGtk;
		if ( parmsType[i] != parmsWrap[i] )
		{
			if ( parmsWrap[i] == "char[]" )
			{
				parmToGtk = "Str.toStringz("
							~ DuitClass.idsToDuit(parms[i], convParms, aliases)
							~")";
			}
			else
			{
				char[] id = DuitClass.idsToDuit(parms[i], convParms, aliases);
				parmToGtk = "("~id~" is null) ? null : "~id~ ".get"~parmsWrap[i]~"Struct()";
			}
		}
		else
		{
			parmToGtk = DuitClass.idsToDuit(parms[i], convParms, aliases);
		}
		return parmToGtk;
	}
	
	char[] parameterToDuit(int i, ConvParms* convParms, char[][char[]] aliases)
	{
		char[] parmToDuit;
		if ( parmsType[i] != parmsWrap[i] )
		{
			if ( parmsWrap[i] == "char[]" )
			{
				parmToDuit = "Str.toString("
							~ DuitClass.idsToDuit(parms[i], convParms, aliases)
							~")";
			}
			else
			{
				//parmToDuit = DuitClass.idsToDuit(parms[i], convParms, aliases);
				parmToDuit = "new "~parmsWrap[i]~"("~DuitClass.idsToDuit(parms[i], convParms, aliases)~")";
			}
		}
		else
		{
			parmToDuit = DuitClass.idsToDuit(parms[i], convParms, aliases);
		}
		return parmToDuit;
	}

	char[] getWrapParametersType()
	{
		char[] pw;
		foreach ( int count, char[] typeW ; parmsWrap )
		{
			if ( count > 0 )
			{
				pw ~= ",";
			}
			pw ~= typeW;
		}
		return pw;
	}
	
	/**
	 * Gets the body of the Duit method.
	 * This include the call to the Gtk function.
	 * If the first parameter is a pointer to the struct make it implicit and use the internal struct
	 * Returns: The text of the body of the function NOT including the braces
	 */
	char[][] bod(ConvParms* convParms, char[][char[]] aliases)
	{
		char[][] bd;
		
		//bd ~= "{";
		
		char[] gtkCall;
		
		debug(ctor)writefln("body ctor = %s",ctor);
		
		if ( type != "void" )
		{
			if ( ctor )
			{
				gtkCall ~= "this(";
				//if ( convParms.strct == "GObject" )
				{
					if ( convParms.realStrct.length > 0 )
					{
						gtkCall ~="cast("~convParms.realStrct~"*)";
					}
					else
					{
						gtkCall ~="cast("~convParms.strct~"*)";
					}
					
				}
			}
			else
			{
				gtkCall ~= "return ";
				if ( type != typeWrap )
				{
					if ( typeWrap == "char[]" )
					{
						gtkCall ~= "Str.toString(";
					}
					else
					{
						gtkCall ~= "new "~typeWrap~"( ";
					}
				}
			}
		}
		
		gtkCall ~= name ~ "(";

		int i=0;
		while ( i<parmsType.length && i< parms.length )
		{

			debug(parm) writefln("\t(%s -> %s) %s",parmsType[i], parmsWrap[i], parms[i]);
			if ( i == 0 )
			{
				if ( parmsType[0]==strctPointer )
				{
					if ( convParms.templ.length == 0 )
					{
						gtkCall ~= DuitClass.toVar(convParms.strct.dup);
					}
					else
					{
						gtkCall ~= "get"~convParms.clss~"Struct()";
					}
				}
				else if ( parms[0].length>0 )
				{
					gtkCall ~= parameterToGtk(0, convParms, aliases);
				}
			}
			else
			{
				if ( parms[i].length>0 )
				{
					gtkCall ~= ", ";
					gtkCall ~= parameterToGtk(i, convParms, aliases);
				}
			}

			
			
			++i;
		}
		
		if ( ctor )
		{
			gtkCall ~= ") ";
		}
		else if ( type != typeWrap )
		{
			gtkCall ~= ") ";
		}

		
		gtkCall ~= ");";

		bd ~= gtkCall;
		//bd ~= "}";
		
		return bd;
	}
	
}