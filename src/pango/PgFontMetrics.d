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


module pango.PgFontMetrics;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtkc.pango;
public  import gtkc.pangotypes;


/**
 * A #PangoFontMetrics structure holds the overall metric information
 * for a font (possibly restricted to a script). The fields of this
 * structure are private to implementations of a font backend. See
 * the documentation of the corresponding getters for documentation
 * of their meaning.
 */
public class PgFontMetrics
{
	/** the main Gtk struct */
	protected PangoFontMetrics* pangoFontMetrics;

	/** Get the main Gtk struct */
	public PangoFontMetrics* getPgFontMetricsStruct()
	{
		return pangoFontMetrics;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)pangoFontMetrics;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoFontMetrics* pangoFontMetrics)
	{
		this.pangoFontMetrics = pangoFontMetrics;
	}


	/** */
	public static GType getType()
	{
		return pango_font_metrics_get_type();
	}

	/**
	 * Creates a new #PangoFontMetrics structure. This is only for
	 * internal use by Pango backends and there is no public way
	 * to set the fields of the structure.
	 *
	 * Return: a newly-created #PangoFontMetrics structure
	 *     with a reference count of 1.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = pango_font_metrics_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(PangoFontMetrics*) p);
	}

	/**
	 * Gets the approximate character width for a font metrics structure.
	 * This is merely a representative value useful, for example, for
	 * determining the initial size for a window. Actual characters in
	 * text will be wider and narrower than this.
	 *
	 * Return: the character width, in Pango units.
	 */
	public int getApproximateCharWidth()
	{
		return pango_font_metrics_get_approximate_char_width(pangoFontMetrics);
	}

	/**
	 * Gets the approximate digit width for a font metrics structure.
	 * This is merely a representative value useful, for example, for
	 * determining the initial size for a window. Actual digits in
	 * text can be wider or narrower than this, though this value
	 * is generally somewhat more accurate than the result of
	 * pango_font_metrics_get_approximate_char_width() for digits.
	 *
	 * Return: the digit width, in Pango units.
	 */
	public int getApproximateDigitWidth()
	{
		return pango_font_metrics_get_approximate_digit_width(pangoFontMetrics);
	}

	/**
	 * Gets the ascent from a font metrics structure. The ascent is
	 * the distance from the baseline to the logical top of a line
	 * of text. (The logical top may be above or below the top of the
	 * actual drawn ink. It is necessary to lay out the text to figure
	 * where the ink will be.)
	 *
	 * Return: the ascent, in Pango units.
	 */
	public int getAscent()
	{
		return pango_font_metrics_get_ascent(pangoFontMetrics);
	}

	/**
	 * Gets the descent from a font metrics structure. The descent is
	 * the distance from the baseline to the logical bottom of a line
	 * of text. (The logical bottom may be above or below the bottom of the
	 * actual drawn ink. It is necessary to lay out the text to figure
	 * where the ink will be.)
	 *
	 * Return: the descent, in Pango units.
	 */
	public int getDescent()
	{
		return pango_font_metrics_get_descent(pangoFontMetrics);
	}

	/**
	 * Gets the suggested position to draw the strikethrough.
	 * The value returned is the distance <emphasis>above</emphasis> the
	 * baseline of the top of the strikethrough.
	 *
	 * Return: the suggested strikethrough position, in Pango units.
	 *
	 * Since: 1.6
	 */
	public int getStrikethroughPosition()
	{
		return pango_font_metrics_get_strikethrough_position(pangoFontMetrics);
	}

	/**
	 * Gets the suggested thickness to draw for the strikethrough.
	 *
	 * Return: the suggested strikethrough thickness, in Pango units.
	 *
	 * Since: 1.6
	 */
	public int getStrikethroughThickness()
	{
		return pango_font_metrics_get_strikethrough_thickness(pangoFontMetrics);
	}

	/**
	 * Gets the suggested position to draw the underline.
	 * The value returned is the distance <emphasis>above</emphasis> the
	 * baseline of the top of the underline. Since most fonts have
	 * underline positions beneath the baseline, this value is typically
	 * negative.
	 *
	 * Return: the suggested underline position, in Pango units.
	 *
	 * Since: 1.6
	 */
	public int getUnderlinePosition()
	{
		return pango_font_metrics_get_underline_position(pangoFontMetrics);
	}

	/**
	 * Gets the suggested thickness to draw for the underline.
	 *
	 * Return: the suggested underline thickness, in Pango units.
	 *
	 * Since: 1.6
	 */
	public int getUnderlineThickness()
	{
		return pango_font_metrics_get_underline_thickness(pangoFontMetrics);
	}

	/**
	 * Increase the reference count of a font metrics structure by one.
	 *
	 * Return: @metrics
	 */
	public PgFontMetrics doref()
	{
		auto p = pango_font_metrics_ref(pangoFontMetrics);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgFontMetrics)(cast(PangoFontMetrics*) p);
	}

	/**
	 * Decrease the reference count of a font metrics structure by one. If
	 * the result is zero, frees the structure and any associated
	 * memory.
	 */
	public void unref()
	{
		pango_font_metrics_unref(pangoFontMetrics);
	}
}
