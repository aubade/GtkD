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


module gtk.PrintOperationPreviewIF;

private import gobject.Signals;
private import gtk.PageSetup;
private import gtk.PrintContext;
public  import gtkc.gdktypes;
private import gtkc.gtk;
public  import gtkc.gtktypes;


/** */
public interface PrintOperationPreviewIF{
	/** Get the main Gtk struct */
	public GtkPrintOperationPreview* getPrintOperationPreviewStruct();

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/**
	 * Ends a preview.
	 *
	 * This function must be called to finish a custom print preview.
	 *
	 * Since: 2.10
	 */
	public void endPreview();

	/**
	 * Returns whether the given page is included in the set of pages that
	 * have been selected for printing.
	 *
	 * Params:
	 *     pageNr = a page number
	 *
	 * Return: %TRUE if the page has been selected for printing
	 *
	 * Since: 2.10
	 */
	public bool isSelected(int pageNr);

	/**
	 * Renders a page to the preview, using the print context that
	 * was passed to the #GtkPrintOperation::preview handler together
	 * with @preview.
	 *
	 * A custom iprint preview should use this function in its ::expose
	 * handler to render the currently selected page.
	 *
	 * Note that this function requires a suitable cairo context to
	 * be associated with the print context.
	 *
	 * Params:
	 *     pageNr = the page to render
	 *
	 * Since: 2.10
	 */
	public void renderPage(int pageNr);
	@property void delegate(PrintContext, PageSetup, PrintOperationPreviewIF)[] onGotPageSizeListeners();
	/**
	 * The ::got-page-size signal is emitted once for each page
	 * that gets rendered to the preview.
	 *
	 * A handler for this signal should update the @context
	 * according to @page_setup and set up a suitable cairo
	 * context, using gtk_print_context_set_cairo_context().
	 *
	 * Params:
	 *     context = the current #GtkPrintContext
	 *     pageSetup = the #GtkPageSetup for the current page
	 */
	void addOnGotPageSize(void delegate(PrintContext, PageSetup, PrintOperationPreviewIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);

	@property void delegate(PrintContext, PrintOperationPreviewIF)[] onReadyListeners();
	/**
	 * The ::ready signal gets emitted once per preview operation,
	 * before the first page is rendered.
	 *
	 * A handler for this signal can be used for setup tasks.
	 *
	 * Params:
	 *     context = the current #GtkPrintContext
	 */
	void addOnReady(void delegate(PrintContext, PrintOperationPreviewIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);

}
