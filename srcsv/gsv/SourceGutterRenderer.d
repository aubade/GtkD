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


module gsv.SourceGutterRenderer;

private import cairo.Context;
private import gdk.Event;
private import gdk.RGBA;
private import gobject.ObjectG;
private import gobject.Signals;
private import gsvc.gsv;
public  import gsvc.gsvtypes;
private import gtk.TextIter;
private import gtk.TextView;
private import gtk.Tooltip;
public  import gtkc.gdktypes;


/** */
public class SourceGutterRenderer : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceGutterRenderer* gtkSourceGutterRenderer;

	/** Get the main Gtk struct */
	public GtkSourceGutterRenderer* getSourceGutterRendererStruct()
	{
		return gtkSourceGutterRenderer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceGutterRenderer;
	}

	protected override void setStruct(GObject* obj)
	{
		gtkSourceGutterRenderer = cast(GtkSourceGutterRenderer*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceGutterRenderer* gtkSourceGutterRenderer, bool ownedRef = false)
	{
		this.gtkSourceGutterRenderer = gtkSourceGutterRenderer;
		super(cast(GObject*)gtkSourceGutterRenderer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_gutter_renderer_get_type();
	}

	/**
	 * Emits the #GtkSourceGutterRenderer::activate signal of the renderer. This is
	 * called from #GtkSourceGutter and should never have to be called manually.
	 *
	 * Params:
	 *     iter = a #GtkTextIter at the start of the line where the renderer is activated
	 *     area = a #GdkRectangle of the cell area where the renderer is activated
	 *     event = the event that triggered the activation
	 */
	public void activate(TextIter iter, GdkRectangle* area, Event event)
	{
		gtk_source_gutter_renderer_activate(gtkSourceGutterRenderer, (iter is null) ? null : iter.getTextIterStruct(), area, (event is null) ? null : event.getEventStruct());
	}

	/**
	 * Called when drawing a region begins. The region to be drawn is indicated
	 * by @start and @end. The purpose is to allow the implementation to precompute
	 * some state before the draw method is called for each cell.
	 *
	 * Params:
	 *     cr = a #cairo_t
	 *     backgroundArea = a #GdkRectangle
	 *     cellArea = a #GdkRectangle
	 *     start = a #GtkTextIter
	 *     end = a #GtkTextIter
	 */
	public void begin(Context cr, GdkRectangle* backgroundArea, GdkRectangle* cellArea, TextIter start, TextIter end)
	{
		gtk_source_gutter_renderer_begin(gtkSourceGutterRenderer, (cr is null) ? null : cr.getContextStruct(), backgroundArea, cellArea, (start is null) ? null : start.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct());
	}

	/**
	 * Main renderering method. Implementations should implement this method to draw
	 * onto the cairo context. The @background_area indicates the total area of the
	 * cell to be drawn. The @cell_area indicates the area where content can be
	 * drawn (text, images, etc).
	 *
	 * The @background_area is the @cell_area plus the padding on each side (two
	 * times the #GtkSourceGutterRenderer:xpad horizontally and two times the
	 * #GtkSourceGutterRenderer:ypad vertically, so that the @cell_area is centered
	 * inside @background_area).
	 *
	 * The @state argument indicates the current state of the renderer and should
	 * be taken into account to properly draw the different possible states
	 * (cursor, prelit, selected) if appropriate.
	 *
	 * Params:
	 *     cr = the cairo render context
	 *     backgroundArea = a #GdkRectangle indicating the total area to be drawn
	 *     cellArea = a #GdkRectangle indicating the area to draw content
	 *     start = a #GtkTextIter
	 *     end = a #GtkTextIter
	 *     state = a #GtkSourceGutterRendererState
	 */
	public void draw(Context cr, GdkRectangle* backgroundArea, GdkRectangle* cellArea, TextIter start, TextIter end, GtkSourceGutterRendererState state)
	{
		gtk_source_gutter_renderer_draw(gtkSourceGutterRenderer, (cr is null) ? null : cr.getContextStruct(), backgroundArea, cellArea, (start is null) ? null : start.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct(), state);
	}

	/**
	 * Called when drawing a region of lines has ended.
	 */
	public void end()
	{
		gtk_source_gutter_renderer_end(gtkSourceGutterRenderer);
	}

	/**
	 * Get the x-alignment and y-alignment of the gutter renderer.
	 *
	 * Params:
	 *     xalign = return location for the x-alignment (can be %NULL)
	 *     yalign = return location for the y-alignment (can be %NULL)
	 */
	public void getAlignment(out float xalign, out float yalign)
	{
		gtk_source_gutter_renderer_get_alignment(gtkSourceGutterRenderer, &xalign, &yalign);
	}

	/**
	 * Get the alignment mode. The alignment mode describes the manner in which the
	 * renderer is aligned (see :xalign and :yalign).
	 *
	 * Return: a #GtkSourceGutterRendererAlignmentMode
	 */
	public GtkSourceGutterRendererAlignmentMode getAlignmentMode()
	{
		return gtk_source_gutter_renderer_get_alignment_mode(gtkSourceGutterRenderer);
	}

	/**
	 * Get the background color of the renderer.
	 *
	 * Params:
	 *     color = return value for a #GdkRGBA
	 *
	 * Return: %TRUE if the background color is set, %FALSE otherwise
	 */
	public bool getBackground(out RGBA color)
	{
		GdkRGBA* outcolor = gMalloc!GdkRGBA();
		
		auto p = gtk_source_gutter_renderer_get_background(gtkSourceGutterRenderer, outcolor) != 0;
		
		color = ObjectG.getDObject!(RGBA)(outcolor);
		
		return p;
	}

	/**
	 * Get the x-padding and y-padding of the gutter renderer.
	 *
	 * Params:
	 *     xpad = return location for the x-padding (can be %NULL)
	 *     ypad = return location for the y-padding (can be %NULL)
	 */
	public void getPadding(out int xpad, out int ypad)
	{
		gtk_source_gutter_renderer_get_padding(gtkSourceGutterRenderer, &xpad, &ypad);
	}

	/**
	 * Get the size of the renderer.
	 *
	 * Return: the size of the renderer.
	 */
	public int getSize()
	{
		return gtk_source_gutter_renderer_get_size(gtkSourceGutterRenderer);
	}

	/**
	 * Get the view associated to the gutter renderer
	 *
	 * Return: a #GtkTextView
	 */
	public TextView getView()
	{
		auto p = gtk_source_gutter_renderer_get_view(gtkSourceGutterRenderer);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(TextView)(cast(GtkTextView*) p);
	}

	/**
	 * Get whether the gutter renderer is visible.
	 *
	 * Return: %TRUE if the renderer is visible, %FALSE otherwise
	 */
	public bool getVisible()
	{
		return gtk_source_gutter_renderer_get_visible(gtkSourceGutterRenderer) != 0;
	}

	/**
	 * Get the #GtkTextWindowType associated with the gutter renderer.
	 *
	 * Return: a #GtkTextWindowType
	 */
	public GtkTextWindowType getWindowType()
	{
		return gtk_source_gutter_renderer_get_window_type(gtkSourceGutterRenderer);
	}

	/**
	 * Get whether the renderer is activatable at the location in @event. This is
	 * called from #GtkSourceGutter to determine whether a renderer is activatable
	 * using the mouse pointer.
	 *
	 * Params:
	 *     iter = a #GtkTextIter at the start of the line to be activated
	 *     area = a #GdkRectangle of the cell area to be activated
	 *     event = the event that triggered the query
	 *
	 * Return: %TRUE if the renderer can be activated, %FALSE otherwise
	 */
	public bool queryActivatable(TextIter iter, GdkRectangle* area, Event event)
	{
		return gtk_source_gutter_renderer_query_activatable(gtkSourceGutterRenderer, (iter is null) ? null : iter.getTextIterStruct(), area, (event is null) ? null : event.getEventStruct()) != 0;
	}

	/**
	 * Emit the #GtkSourceGutterRenderer::query-data signal. This function is called
	 * to query for data just before rendering a cell. This is called from the
	 * #GtkSourceGutter.  Implementations can override the default signal handler or
	 * can connect a signal handler externally to the
	 * #GtkSourceGutterRenderer::query-data signal.
	 *
	 * Params:
	 *     start = a #GtkTextIter.
	 *     end = a #GtkTextIter.
	 *     state = a #GtkSourceGutterRendererState.
	 */
	public void queryData(TextIter start, TextIter end, GtkSourceGutterRendererState state)
	{
		gtk_source_gutter_renderer_query_data(gtkSourceGutterRenderer, (start is null) ? null : start.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct(), state);
	}

	/**
	 * Emits the #GtkSourceGutterRenderer::query-tooltip signal. This function is
	 * called from #GtkSourceGutter. Implementations can override the default signal
	 * handler or can connect to the signal externally.
	 *
	 * Params:
	 *     iter = a #GtkTextIter.
	 *     area = a #GdkRectangle.
	 *     x = The x position of the tooltip.
	 *     y = The y position of the tooltip.
	 *     tooltip = a #GtkTooltip.
	 *
	 * Return: %TRUE if the tooltip has been set, %FALSE otherwise
	 */
	public bool queryTooltip(TextIter iter, GdkRectangle* area, int x, int y, Tooltip tooltip)
	{
		return gtk_source_gutter_renderer_query_tooltip(gtkSourceGutterRenderer, (iter is null) ? null : iter.getTextIterStruct(), area, x, y, (tooltip is null) ? null : tooltip.getTooltipStruct()) != 0;
	}

	/**
	 * Emits the #GtkSourceGutterRenderer::queue-draw signal of the renderer. Call
	 * this from an implementation to inform that the renderer has changed such that
	 * it needs to redraw.
	 */
	public void queueDraw()
	{
		gtk_source_gutter_renderer_queue_draw(gtkSourceGutterRenderer);
	}

	/**
	 * Set the alignment of the gutter renderer. Both @xalign and @yalign can be
	 * -1, which means the values will not be changed (this allows changing only
	 * one of the values).
	 *
	 * @xalign is the horizontal alignment. Set to 0 for a left alignment. 1 for a
	 * right alignment. And 0.5 for centering the cells. @yalign is the vertical
	 * alignment. Set to 0 for a top alignment. 1 for a bottom alignment.
	 *
	 * Params:
	 *     xalign = the x-alignment
	 *     yalign = the y-alignment
	 */
	public void setAlignment(float xalign, float yalign)
	{
		gtk_source_gutter_renderer_set_alignment(gtkSourceGutterRenderer, xalign, yalign);
	}

	/**
	 * Set the alignment mode. The alignment mode describes the manner in which the
	 * renderer is aligned (see :xalign and :yalign).
	 *
	 * Params:
	 *     mode = a #GtkSourceGutterRendererAlignmentMode
	 */
	public void setAlignmentMode(GtkSourceGutterRendererAlignmentMode mode)
	{
		gtk_source_gutter_renderer_set_alignment_mode(gtkSourceGutterRenderer, mode);
	}

	/**
	 * Set the background color of the renderer. If @color is set to %NULL, the
	 * renderer will not have a background color.
	 *
	 * Params:
	 *     color = a #GdkRGBA or %NULL
	 */
	public void setBackground(RGBA color)
	{
		gtk_source_gutter_renderer_set_background(gtkSourceGutterRenderer, (color is null) ? null : color.getRGBAStruct());
	}

	/**
	 * Set the padding of the gutter renderer. Both @xpad and @ypad can be
	 * -1, which means the values will not be changed (this allows changing only
	 * one of the values).
	 *
	 * @xpad is the left and right padding. @ypad is the top and bottom padding.
	 *
	 * Params:
	 *     xpad = the x-padding
	 *     ypad = the y-padding
	 */
	public void setPadding(int xpad, int ypad)
	{
		gtk_source_gutter_renderer_set_padding(gtkSourceGutterRenderer, xpad, ypad);
	}

	/**
	 * Sets the size of the renderer. A value of -1 specifies that the size
	 * is to be determined dynamically.
	 *
	 * Params:
	 *     size = the size
	 */
	public void setSize(int size)
	{
		gtk_source_gutter_renderer_set_size(gtkSourceGutterRenderer, size);
	}

	/**
	 * Set whether the gutter renderer is visible.
	 *
	 * Params:
	 *     visible = the visibility
	 */
	public void setVisible(bool visible)
	{
		gtk_source_gutter_renderer_set_visible(gtkSourceGutterRenderer, visible);
	}

	int[string] connectedSignals;

	void delegate(TextIter, GdkRectangle*, Event, SourceGutterRenderer)[] onActivateListeners;
	/**
	 * The ::activate signal is emitted when the renderer is
	 * activated.
	 *
	 * Params:
	 *     iter = a #GtkTextIter
	 *     area = a #GdkRectangle
	 *     event = the event that caused the activation
	 */
	void addOnActivate(void delegate(TextIter, GdkRectangle*, Event, SourceGutterRenderer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "activate" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"activate",
				cast(GCallback)&callBackActivate,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["activate"] = 1;
		}
		onActivateListeners ~= dlg;
	}
	extern(C) static void callBackActivate(GtkSourceGutterRenderer* sourcegutterrendererStruct, GtkTextIter* iter, GdkRectangle* area, GdkEvent* event, SourceGutterRenderer _sourcegutterrenderer)
	{
		foreach ( void delegate(TextIter, GdkRectangle*, Event, SourceGutterRenderer) dlg; _sourcegutterrenderer.onActivateListeners )
		{
			dlg(ObjectG.getDObject!(TextIter)(iter), area, ObjectG.getDObject!(Event)(event), _sourcegutterrenderer);
		}
	}

	bool delegate(TextIter, GdkRectangle*, Event, SourceGutterRenderer)[] onQueryActivatableListeners;
	/**
	 * The ::query-activatable signal is emitted when the renderer
	 * can possibly be activated.
	 *
	 * Params:
	 *     iter = a #GtkTextIter
	 *     area = a #GdkRectangle
	 *     event = the #GdkEvent that is causing the activatable query
	 */
	void addOnQueryActivatable(bool delegate(TextIter, GdkRectangle*, Event, SourceGutterRenderer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "query-activatable" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"query-activatable",
				cast(GCallback)&callBackQueryActivatable,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["query-activatable"] = 1;
		}
		onQueryActivatableListeners ~= dlg;
	}
	extern(C) static int callBackQueryActivatable(GtkSourceGutterRenderer* sourcegutterrendererStruct, GtkTextIter* iter, GdkRectangle* area, GdkEvent* event, SourceGutterRenderer _sourcegutterrenderer)
	{
		foreach ( bool delegate(TextIter, GdkRectangle*, Event, SourceGutterRenderer) dlg; _sourcegutterrenderer.onQueryActivatableListeners )
		{
			if ( dlg(ObjectG.getDObject!(TextIter)(iter), area, ObjectG.getDObject!(Event)(event), _sourcegutterrenderer) )
			{
				return 1;
			}
		}
		
		return 0;
	}

	void delegate(TextIter, TextIter, GtkSourceGutterRendererState, SourceGutterRenderer)[] onQueryDataListeners;
	/**
	 * The ::query-data signal is emitted when the renderer needs
	 * to be filled with data just before a cell is drawn. This can
	 * be used by general renderer implementations to allow render
	 * data to be filled in externally.
	 *
	 * Params:
	 *     start = a #GtkTextIter
	 *     end = a #GtkTextIter
	 *     state = the renderer state
	 */
	void addOnQueryData(void delegate(TextIter, TextIter, GtkSourceGutterRendererState, SourceGutterRenderer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "query-data" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"query-data",
				cast(GCallback)&callBackQueryData,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["query-data"] = 1;
		}
		onQueryDataListeners ~= dlg;
	}
	extern(C) static void callBackQueryData(GtkSourceGutterRenderer* sourcegutterrendererStruct, GtkTextIter* start, GtkTextIter* end, GtkSourceGutterRendererState state, SourceGutterRenderer _sourcegutterrenderer)
	{
		foreach ( void delegate(TextIter, TextIter, GtkSourceGutterRendererState, SourceGutterRenderer) dlg; _sourcegutterrenderer.onQueryDataListeners )
		{
			dlg(ObjectG.getDObject!(TextIter)(start), ObjectG.getDObject!(TextIter)(end), state, _sourcegutterrenderer);
		}
	}

	bool delegate(TextIter, GdkRectangle*, int, int, Tooltip, SourceGutterRenderer)[] onQueryTooltipListeners;
	/**
	 * The ::query-tooltip signal is emitted when the renderer can
	 * show a tooltip.
	 *
	 * Params:
	 *     iter = a #GtkTextIter
	 *     area = a #GdkRectangle
	 *     x = the x position (in window coordinates)
	 *     y = the y position (in window coordinates)
	 *     tooltip = a #GtkTooltip
	 */
	void addOnQueryTooltip(bool delegate(TextIter, GdkRectangle*, int, int, Tooltip, SourceGutterRenderer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "query-tooltip" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"query-tooltip",
				cast(GCallback)&callBackQueryTooltip,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["query-tooltip"] = 1;
		}
		onQueryTooltipListeners ~= dlg;
	}
	extern(C) static int callBackQueryTooltip(GtkSourceGutterRenderer* sourcegutterrendererStruct, GtkTextIter* iter, GdkRectangle* area, int x, int y, GtkTooltip* tooltip, SourceGutterRenderer _sourcegutterrenderer)
	{
		foreach ( bool delegate(TextIter, GdkRectangle*, int, int, Tooltip, SourceGutterRenderer) dlg; _sourcegutterrenderer.onQueryTooltipListeners )
		{
			if ( dlg(ObjectG.getDObject!(TextIter)(iter), area, x, y, ObjectG.getDObject!(Tooltip)(tooltip), _sourcegutterrenderer) )
			{
				return 1;
			}
		}
		
		return 0;
	}

	void delegate(SourceGutterRenderer)[] onQueueDrawListeners;
	/**
	 * The ::queue-draw signal is emitted when the renderer needs
	 * to be redrawn. Use gtk_source_gutter_renderer_queue_draw()
	 * to emit this signal from an implementation of the
	 * #GtkSourceGutterRenderer interface.
	 */
	void addOnQueueDraw(void delegate(SourceGutterRenderer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "queue-draw" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"queue-draw",
				cast(GCallback)&callBackQueueDraw,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["queue-draw"] = 1;
		}
		onQueueDrawListeners ~= dlg;
	}
	extern(C) static void callBackQueueDraw(GtkSourceGutterRenderer* sourcegutterrendererStruct, SourceGutterRenderer _sourcegutterrenderer)
	{
		foreach ( void delegate(SourceGutterRenderer) dlg; _sourcegutterrenderer.onQueueDrawListeners )
		{
			dlg(_sourcegutterrenderer);
		}
	}
}
