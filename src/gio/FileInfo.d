/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module gio.FileInfo;

private import gio.FileAttributeMatcher;
private import gio.Icon;
private import gio.IconIF;
private import glib.ConstructionException;
private import glib.DateTime;
private import glib.Str;
private import glib.TimeVal;
private import gobject.ObjectG;
private import gtkc.gio;
public  import gtkc.giotypes;


/**
 * Functionality for manipulating basic metadata for files. #GFileInfo
 * implements methods for getting information that all files should
 * contain, and allows for manipulation of extended attributes.
 * 
 * See [GFileAttribute][gio-GFileAttribute] for more information on how
 * GIO handles file attributes.
 * 
 * To obtain a #GFileInfo for a #GFile, use g_file_query_info() (or its
 * async variant). To obtain a #GFileInfo for a file input or output
 * stream, use g_file_input_stream_query_info() or
 * g_file_output_stream_query_info() (or their async variants).
 * 
 * To change the actual attributes of a file, you should then set the
 * attribute in the #GFileInfo and call g_file_set_attributes_from_info()
 * or g_file_set_attributes_async() on a GFile.
 * 
 * However, not all attributes can be changed in the file. For instance,
 * the actual size of a file cannot be changed via g_file_info_set_size().
 * You may call g_file_query_settable_attributes() and
 * g_file_query_writable_namespaces() to discover the settable attributes
 * of a particular file at runtime.
 * 
 * #GFileAttributeMatcher allows for searching through a #GFileInfo for
 * attributes.
 */
public class FileInfo : ObjectG
{
	/** the main Gtk struct */
	protected GFileInfo* gFileInfo;

	/** Get the main Gtk struct */
	public GFileInfo* getFileInfoStruct()
	{
		return gFileInfo;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gFileInfo;
	}

	protected override void setStruct(GObject* obj)
	{
		gFileInfo = cast(GFileInfo*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GFileInfo* gFileInfo, bool ownedRef = false)
	{
		this.gFileInfo = gFileInfo;
		super(cast(GObject*)gFileInfo, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_file_info_get_type();
	}

	/**
	 * Creates a new file info structure.
	 *
	 * Return: a #GFileInfo.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = g_file_info_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GFileInfo*) p, true);
	}

	/**
	 * Clears the status information from @info.
	 */
	public void clearStatus()
	{
		g_file_info_clear_status(gFileInfo);
	}

	/**
	 * Copies all of the [GFileAttribute][gio-GFileAttribute]
	 * from @src_info to @dest_info.
	 *
	 * Params:
	 *     destInfo = destination to copy attributes to.
	 */
	public void copyInto(FileInfo destInfo)
	{
		g_file_info_copy_into(gFileInfo, (destInfo is null) ? null : destInfo.getFileInfoStruct());
	}

	/**
	 * Duplicates a file info structure.
	 *
	 * Return: a duplicate #GFileInfo of @other.
	 */
	public FileInfo dup()
	{
		auto p = g_file_info_dup(gFileInfo);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(FileInfo)(cast(GFileInfo*) p, true);
	}

	/**
	 * Gets the value of a attribute, formated as a string.
	 * This escapes things as needed to make the string valid
	 * utf8.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: a UTF-8 string associated with the given @attribute.
	 *     When you're done with the string it must be freed with g_free().
	 */
	public string getAttributeAsString(string attribute)
	{
		return Str.toString(g_file_info_get_attribute_as_string(gFileInfo, Str.toStringz(attribute)));
	}

	/**
	 * Gets the value of a boolean attribute. If the attribute does not
	 * contain a boolean value, %FALSE will be returned.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: the boolean value contained within the attribute.
	 */
	public bool getAttributeBoolean(string attribute)
	{
		return g_file_info_get_attribute_boolean(gFileInfo, Str.toStringz(attribute)) != 0;
	}

	/**
	 * Gets the value of a byte string attribute. If the attribute does
	 * not contain a byte string, %NULL will be returned.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: the contents of the @attribute value as a byte string, or
	 *     %NULL otherwise.
	 */
	public string getAttributeByteString(string attribute)
	{
		return Str.toString(g_file_info_get_attribute_byte_string(gFileInfo, Str.toStringz(attribute)));
	}

	/**
	 * Gets the attribute type, value and status for an attribute key.
	 *
	 * Params:
	 *     attribute = a file attribute key
	 *     type = return location for the attribute type, or %NULL
	 *     valuePp = return location for the attribute value, or %NULL
	 *     status = return location for the attribute status, or %NULL
	 *
	 * Return: %TRUE if @info has an attribute named @attribute,
	 *     %FALSE otherwise.
	 */
	public bool getAttributeData(string attribute, out GFileAttributeType type, out void* valuePp, out GFileAttributeStatus status)
	{
		return g_file_info_get_attribute_data(gFileInfo, Str.toStringz(attribute), &type, &valuePp, &status) != 0;
	}

	/**
	 * Gets a signed 32-bit integer contained within the attribute. If the
	 * attribute does not contain a signed 32-bit integer, or is invalid,
	 * 0 will be returned.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: a signed 32-bit integer from the attribute.
	 */
	public int getAttributeInt32(string attribute)
	{
		return g_file_info_get_attribute_int32(gFileInfo, Str.toStringz(attribute));
	}

	/**
	 * Gets a signed 64-bit integer contained within the attribute. If the
	 * attribute does not contain an signed 64-bit integer, or is invalid,
	 * 0 will be returned.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: a signed 64-bit integer from the attribute.
	 */
	public long getAttributeInt64(string attribute)
	{
		return g_file_info_get_attribute_int64(gFileInfo, Str.toStringz(attribute));
	}

	/**
	 * Gets the value of a #GObject attribute. If the attribute does
	 * not contain a #GObject, %NULL will be returned.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: a #GObject associated with the given @attribute, or
	 *     %NULL otherwise.
	 */
	public ObjectG getAttributeObject(string attribute)
	{
		auto p = g_file_info_get_attribute_object(gFileInfo, Str.toStringz(attribute));
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(ObjectG)(cast(GObject*) p);
	}

	/**
	 * Gets the attribute status for an attribute key.
	 *
	 * Params:
	 *     attribute = a file attribute key
	 *
	 * Return: a #GFileAttributeStatus for the given @attribute, or
	 *     %G_FILE_ATTRIBUTE_STATUS_UNSET if the key is invalid.
	 */
	public GFileAttributeStatus getAttributeStatus(string attribute)
	{
		return g_file_info_get_attribute_status(gFileInfo, Str.toStringz(attribute));
	}

	/**
	 * Gets the value of a string attribute. If the attribute does
	 * not contain a string, %NULL will be returned.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: the contents of the @attribute value as a UTF-8 string, or
	 *     %NULL otherwise.
	 */
	public string getAttributeString(string attribute)
	{
		return Str.toString(g_file_info_get_attribute_string(gFileInfo, Str.toStringz(attribute)));
	}

	/**
	 * Gets the value of a stringv attribute. If the attribute does
	 * not contain a stringv, %NULL will be returned.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: the contents of the @attribute value as a stringv, or
	 *     %NULL otherwise. Do not free. These returned strings are UTF-8.
	 *
	 * Since: 2.22
	 */
	public string[] getAttributeStringv(string attribute)
	{
		return Str.toStringArray(g_file_info_get_attribute_stringv(gFileInfo, Str.toStringz(attribute)));
	}

	/**
	 * Gets the attribute type for an attribute key.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: a #GFileAttributeType for the given @attribute, or
	 *     %G_FILE_ATTRIBUTE_TYPE_INVALID if the key is not set.
	 */
	public GFileAttributeType getAttributeType(string attribute)
	{
		return g_file_info_get_attribute_type(gFileInfo, Str.toStringz(attribute));
	}

	/**
	 * Gets an unsigned 32-bit integer contained within the attribute. If the
	 * attribute does not contain an unsigned 32-bit integer, or is invalid,
	 * 0 will be returned.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: an unsigned 32-bit integer from the attribute.
	 */
	public uint getAttributeUint32(string attribute)
	{
		return g_file_info_get_attribute_uint32(gFileInfo, Str.toStringz(attribute));
	}

	/**
	 * Gets a unsigned 64-bit integer contained within the attribute. If the
	 * attribute does not contain an unsigned 64-bit integer, or is invalid,
	 * 0 will be returned.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: a unsigned 64-bit integer from the attribute.
	 */
	public ulong getAttributeUint64(string attribute)
	{
		return g_file_info_get_attribute_uint64(gFileInfo, Str.toStringz(attribute));
	}

	/**
	 * Gets the file's content type.
	 *
	 * Return: a string containing the file's content type.
	 */
	public string getContentType()
	{
		return Str.toString(g_file_info_get_content_type(gFileInfo));
	}

	/**
	 * Returns the #GDateTime representing the deletion date of the file, as
	 * available in G_FILE_ATTRIBUTE_TRASH_DELETION_DATE. If the
	 * G_FILE_ATTRIBUTE_TRASH_DELETION_DATE attribute is unset, %NULL is returned.
	 *
	 * Return: a #GDateTime, or %NULL.
	 *
	 * Since: 2.36
	 */
	public DateTime getDeletionDate()
	{
		auto p = g_file_info_get_deletion_date(gFileInfo);
		
		if(p is null)
		{
			return null;
		}
		
		return new DateTime(cast(GDateTime*) p);
	}

	/**
	 * Gets a display name for a file.
	 *
	 * Return: a string containing the display name.
	 */
	public string getDisplayName()
	{
		return Str.toString(g_file_info_get_display_name(gFileInfo));
	}

	/**
	 * Gets the edit name for a file.
	 *
	 * Return: a string containing the edit name.
	 */
	public string getEditName()
	{
		return Str.toString(g_file_info_get_edit_name(gFileInfo));
	}

	/**
	 * Gets the [entity tag][gfile-etag] for a given
	 * #GFileInfo. See %G_FILE_ATTRIBUTE_ETAG_VALUE.
	 *
	 * Return: a string containing the value of the "etag:value" attribute.
	 */
	public string getEtag()
	{
		return Str.toString(g_file_info_get_etag(gFileInfo));
	}

	/**
	 * Gets a file's type (whether it is a regular file, symlink, etc).
	 * This is different from the file's content type, see g_file_info_get_content_type().
	 *
	 * Return: a #GFileType for the given file.
	 */
	public GFileType getFileType()
	{
		return g_file_info_get_file_type(gFileInfo);
	}

	/**
	 * Gets the icon for a file.
	 *
	 * Return: #GIcon for the given @info.
	 */
	public IconIF getIcon()
	{
		auto p = g_file_info_get_icon(gFileInfo);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Icon, IconIF)(cast(GIcon*) p);
	}

	/**
	 * Checks if a file is a backup file.
	 *
	 * Return: %TRUE if file is a backup file, %FALSE otherwise.
	 */
	public bool getIsBackup()
	{
		return g_file_info_get_is_backup(gFileInfo) != 0;
	}

	/**
	 * Checks if a file is hidden.
	 *
	 * Return: %TRUE if the file is a hidden file, %FALSE otherwise.
	 */
	public bool getIsHidden()
	{
		return g_file_info_get_is_hidden(gFileInfo) != 0;
	}

	/**
	 * Checks if a file is a symlink.
	 *
	 * Return: %TRUE if the given @info is a symlink.
	 */
	public bool getIsSymlink()
	{
		return g_file_info_get_is_symlink(gFileInfo) != 0;
	}

	/**
	 * Gets the modification time of the current @info and sets it
	 * in @result.
	 *
	 * Params:
	 *     result = a #GTimeVal.
	 */
	public void getModificationTime(out TimeVal result)
	{
		GTimeVal* outresult = gMalloc!GTimeVal();
		
		g_file_info_get_modification_time(gFileInfo, outresult);
		
		result = new TimeVal(outresult);
	}

	/**
	 * Gets the name for a file.
	 *
	 * Return: a string containing the file name.
	 */
	public string getName()
	{
		return Str.toString(g_file_info_get_name(gFileInfo));
	}

	/**
	 * Gets the file's size.
	 *
	 * Return: a #goffset containing the file's size.
	 */
	public long getSize()
	{
		return g_file_info_get_size(gFileInfo);
	}

	/**
	 * Gets the value of the sort_order attribute from the #GFileInfo.
	 * See %G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER.
	 *
	 * Return: a #gint32 containing the value of the "standard::sort_order" attribute.
	 */
	public int getSortOrder()
	{
		return g_file_info_get_sort_order(gFileInfo);
	}

	/**
	 * Gets the symbolic icon for a file.
	 *
	 * Return: #GIcon for the given @info.
	 *
	 * Since: 2.34
	 */
	public IconIF getSymbolicIcon()
	{
		auto p = g_file_info_get_symbolic_icon(gFileInfo);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Icon, IconIF)(cast(GIcon*) p);
	}

	/**
	 * Gets the symlink target for a given #GFileInfo.
	 *
	 * Return: a string containing the symlink target.
	 */
	public string getSymlinkTarget()
	{
		return Str.toString(g_file_info_get_symlink_target(gFileInfo));
	}

	/**
	 * Checks if a file info structure has an attribute named @attribute.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *
	 * Return: %TRUE if @Ginfo has an attribute named @attribute,
	 *     %FALSE otherwise.
	 */
	public bool hasAttribute(string attribute)
	{
		return g_file_info_has_attribute(gFileInfo, Str.toStringz(attribute)) != 0;
	}

	/**
	 * Checks if a file info structure has an attribute in the
	 * specified @name_space.
	 *
	 * Params:
	 *     nameSpace = a file attribute namespace.
	 *
	 * Return: %TRUE if @Ginfo has an attribute in @name_space,
	 *     %FALSE otherwise.
	 *
	 * Since: 2.22
	 */
	public bool hasNamespace(string nameSpace)
	{
		return g_file_info_has_namespace(gFileInfo, Str.toStringz(nameSpace)) != 0;
	}

	/**
	 * Lists the file info structure's attributes.
	 *
	 * Params:
	 *     nameSpace = a file attribute key's namespace.
	 *
	 * Return: a
	 *     null-terminated array of strings of all of the possible attribute
	 *     types for the given @name_space, or %NULL on error.
	 */
	public string[] listAttributes(string nameSpace)
	{
		return Str.toStringArray(g_file_info_list_attributes(gFileInfo, Str.toStringz(nameSpace)));
	}

	/**
	 * Removes all cases of @attribute from @info if it exists.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 */
	public void removeAttribute(string attribute)
	{
		g_file_info_remove_attribute(gFileInfo, Str.toStringz(attribute));
	}

	/**
	 * Sets the @attribute to contain the given value, if possible. To unset the
	 * attribute, use %G_ATTRIBUTE_TYPE_INVALID for @type.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *     type = a #GFileAttributeType
	 *     valueP = pointer to the value
	 */
	public void setAttribute(string attribute, GFileAttributeType type, void* valueP)
	{
		g_file_info_set_attribute(gFileInfo, Str.toStringz(attribute), type, valueP);
	}

	/**
	 * Sets the @attribute to contain the given @attr_value,
	 * if possible.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *     attrValue = a boolean value.
	 */
	public void setAttributeBoolean(string attribute, bool attrValue)
	{
		g_file_info_set_attribute_boolean(gFileInfo, Str.toStringz(attribute), attrValue);
	}

	/**
	 * Sets the @attribute to contain the given @attr_value,
	 * if possible.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *     attrValue = a byte string.
	 */
	public void setAttributeByteString(string attribute, string attrValue)
	{
		g_file_info_set_attribute_byte_string(gFileInfo, Str.toStringz(attribute), Str.toStringz(attrValue));
	}

	/**
	 * Sets the @attribute to contain the given @attr_value,
	 * if possible.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *     attrValue = a signed 32-bit integer
	 */
	public void setAttributeInt32(string attribute, int attrValue)
	{
		g_file_info_set_attribute_int32(gFileInfo, Str.toStringz(attribute), attrValue);
	}

	/**
	 * Sets the @attribute to contain the given @attr_value,
	 * if possible.
	 *
	 * Params:
	 *     attribute = attribute name to set.
	 *     attrValue = int64 value to set attribute to.
	 */
	public void setAttributeInt64(string attribute, long attrValue)
	{
		g_file_info_set_attribute_int64(gFileInfo, Str.toStringz(attribute), attrValue);
	}

	/**
	 * Sets @mask on @info to match specific attribute types.
	 *
	 * Params:
	 *     mask = a #GFileAttributeMatcher.
	 */
	public void setAttributeMask(FileAttributeMatcher mask)
	{
		g_file_info_set_attribute_mask(gFileInfo, (mask is null) ? null : mask.getFileAttributeMatcherStruct());
	}

	/**
	 * Sets the @attribute to contain the given @attr_value,
	 * if possible.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *     attrValue = a #GObject.
	 */
	public void setAttributeObject(string attribute, ObjectG attrValue)
	{
		g_file_info_set_attribute_object(gFileInfo, Str.toStringz(attribute), (attrValue is null) ? null : attrValue.getObjectGStruct());
	}

	/**
	 * Sets the attribute status for an attribute key. This is only
	 * needed by external code that implement g_file_set_attributes_from_info()
	 * or similar functions.
	 *
	 * The attribute must exist in @info for this to work. Otherwise %FALSE
	 * is returned and @info is unchanged.
	 *
	 * Params:
	 *     attribute = a file attribute key
	 *     status = a #GFileAttributeStatus
	 *
	 * Return: %TRUE if the status was changed, %FALSE if the key was not set.
	 *
	 * Since: 2.22
	 */
	public bool setAttributeStatus(string attribute, GFileAttributeStatus status)
	{
		return g_file_info_set_attribute_status(gFileInfo, Str.toStringz(attribute), status) != 0;
	}

	/**
	 * Sets the @attribute to contain the given @attr_value,
	 * if possible.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *     attrValue = a UTF-8 string.
	 */
	public void setAttributeString(string attribute, string attrValue)
	{
		g_file_info_set_attribute_string(gFileInfo, Str.toStringz(attribute), Str.toStringz(attrValue));
	}

	/**
	 * Sets the @attribute to contain the given @attr_value,
	 * if possible.
	 *
	 * Sinze: 2.22
	 *
	 * Params:
	 *     attribute = a file attribute key
	 *     attrValue = a %NULL terminated array of UTF-8 strings.
	 */
	public void setAttributeStringv(string attribute, string[] attrValue)
	{
		g_file_info_set_attribute_stringv(gFileInfo, Str.toStringz(attribute), Str.toStringzArray(attrValue));
	}

	/**
	 * Sets the @attribute to contain the given @attr_value,
	 * if possible.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *     attrValue = an unsigned 32-bit integer.
	 */
	public void setAttributeUint32(string attribute, uint attrValue)
	{
		g_file_info_set_attribute_uint32(gFileInfo, Str.toStringz(attribute), attrValue);
	}

	/**
	 * Sets the @attribute to contain the given @attr_value,
	 * if possible.
	 *
	 * Params:
	 *     attribute = a file attribute key.
	 *     attrValue = an unsigned 64-bit integer.
	 */
	public void setAttributeUint64(string attribute, ulong attrValue)
	{
		g_file_info_set_attribute_uint64(gFileInfo, Str.toStringz(attribute), attrValue);
	}

	/**
	 * Sets the content type attribute for a given #GFileInfo.
	 * See %G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE.
	 *
	 * Params:
	 *     contentType = a content type. See [GContentType][gio-GContentType]
	 */
	public void setContentType(string contentType)
	{
		g_file_info_set_content_type(gFileInfo, Str.toStringz(contentType));
	}

	/**
	 * Sets the display name for the current #GFileInfo.
	 * See %G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME.
	 *
	 * Params:
	 *     displayName = a string containing a display name.
	 */
	public void setDisplayName(string displayName)
	{
		g_file_info_set_display_name(gFileInfo, Str.toStringz(displayName));
	}

	/**
	 * Sets the edit name for the current file.
	 * See %G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME.
	 *
	 * Params:
	 *     editName = a string containing an edit name.
	 */
	public void setEditName(string editName)
	{
		g_file_info_set_edit_name(gFileInfo, Str.toStringz(editName));
	}

	/**
	 * Sets the file type in a #GFileInfo to @type.
	 * See %G_FILE_ATTRIBUTE_STANDARD_TYPE.
	 *
	 * Params:
	 *     type = a #GFileType.
	 */
	public void setFileType(GFileType type)
	{
		g_file_info_set_file_type(gFileInfo, type);
	}

	/**
	 * Sets the icon for a given #GFileInfo.
	 * See %G_FILE_ATTRIBUTE_STANDARD_ICON.
	 *
	 * Params:
	 *     icon = a #GIcon.
	 */
	public void setIcon(IconIF icon)
	{
		g_file_info_set_icon(gFileInfo, (icon is null) ? null : icon.getIconStruct());
	}

	/**
	 * Sets the "is_hidden" attribute in a #GFileInfo according to @is_hidden.
	 * See %G_FILE_ATTRIBUTE_STANDARD_IS_HIDDEN.
	 *
	 * Params:
	 *     isHidden = a #gboolean.
	 */
	public void setIsHidden(bool isHidden)
	{
		g_file_info_set_is_hidden(gFileInfo, isHidden);
	}

	/**
	 * Sets the "is_symlink" attribute in a #GFileInfo according to @is_symlink.
	 * See %G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK.
	 *
	 * Params:
	 *     isSymlink = a #gboolean.
	 */
	public void setIsSymlink(bool isSymlink)
	{
		g_file_info_set_is_symlink(gFileInfo, isSymlink);
	}

	/**
	 * Sets the %G_FILE_ATTRIBUTE_TIME_MODIFIED attribute in the file
	 * info to the given time value.
	 *
	 * Params:
	 *     mtime = a #GTimeVal.
	 */
	public void setModificationTime(TimeVal mtime)
	{
		g_file_info_set_modification_time(gFileInfo, (mtime is null) ? null : mtime.getTimeValStruct());
	}

	/**
	 * Sets the name attribute for the current #GFileInfo.
	 * See %G_FILE_ATTRIBUTE_STANDARD_NAME.
	 *
	 * Params:
	 *     name = a string containing a name.
	 */
	public void setName(string name)
	{
		g_file_info_set_name(gFileInfo, Str.toStringz(name));
	}

	/**
	 * Sets the %G_FILE_ATTRIBUTE_STANDARD_SIZE attribute in the file info
	 * to the given size.
	 *
	 * Params:
	 *     size = a #goffset containing the file's size.
	 */
	public void setSize(long size)
	{
		g_file_info_set_size(gFileInfo, size);
	}

	/**
	 * Sets the sort order attribute in the file info structure. See
	 * %G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER.
	 *
	 * Params:
	 *     sortOrder = a sort order integer.
	 */
	public void setSortOrder(int sortOrder)
	{
		g_file_info_set_sort_order(gFileInfo, sortOrder);
	}

	/**
	 * Sets the symbolic icon for a given #GFileInfo.
	 * See %G_FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON.
	 *
	 * Params:
	 *     icon = a #GIcon.
	 *
	 * Since: 2.34
	 */
	public void setSymbolicIcon(IconIF icon)
	{
		g_file_info_set_symbolic_icon(gFileInfo, (icon is null) ? null : icon.getIconStruct());
	}

	/**
	 * Sets the %G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET attribute in the file info
	 * to the given symlink target.
	 *
	 * Params:
	 *     symlinkTarget = a static string containing a path to a symlink target.
	 */
	public void setSymlinkTarget(string symlinkTarget)
	{
		g_file_info_set_symlink_target(gFileInfo, Str.toStringz(symlinkTarget));
	}

	/**
	 * Unsets a mask set by g_file_info_set_attribute_mask(), if one
	 * is set.
	 */
	public void unsetAttributeMask()
	{
		g_file_info_unset_attribute_mask(gFileInfo);
	}
}
