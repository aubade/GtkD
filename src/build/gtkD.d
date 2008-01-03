/*
 * Automatically generated build imports from
 * the initial version generouselly given by:
 * John Reimer
 */

module build;

version( build )
{
	pragma (nolink);

	version (Windows)     pragma (target, "GtkD.lib"  );
	version (linux)   pragma (target, "libgtkd.a" );
}



private import glib.GLib;
private import glib.Atomic;
private import glib.MainLoop;
private import glib.MainContext;
private import glib.Timeout;
private import glib.Child;
private import glib.Source;
private import glib.ThreadPool;
private import glib.AsyncQueue;
private import glib.Module;
private import glib.Memory;
private import glib.IOChannel;
private import glib.ErrorG;
private import glib.Messages;
private import glib.MessageLog;
private import glib.Str;
private import glib.CharacterSet;
private import glib.Unicode;
private import glib.Internationalization;
private import glib.Date;
private import glib.RandG;
private import glib.Util;
private import glib.ScannerG;
private import glib.StringCompletion;
private import glib.Timer;
private import glib.Spawn;
private import glib.FileUtils;
private import glib.ShellUtils;
private import glib.OptionContext;
private import glib.OptionGroup;
private import glib.Pattern;
private import glib.SimpleXML;
private import glib.GKeyFile;
private import glib.WindowsUtils;
private import glib.MemorySlice;
private import glib.MemoryChunk;
private import glib.ListG;
private import glib.ListSG;
private import glib.QueueG;
private import glib.TrashStack;
private import glib.HashTable;
private import glib.StringG;
private import glib.StringGChunk;
private import glib.ArrayG;
private import glib.PtrArray;
private import glib.ByteArray;
private import glib.BBTree;
private import glib.Node;
private import glib.Quark;
private import glib.DataList;
private import glib.Dataset;
private import glib.Relation;
private import glib.Tuples;
private import glib.Cache;
private import glib.Allocator;

private import gthread.Mutex;
private import gthread.StaticRecMutex;
private import gthread.RWLock;
private import gthread.Cond;
private import gthread.Private;
private import gthread.StaticPrivate;
private import gthread.Thread;

private import gobject.Type;
private import gobject.TypePlugin;
private import gobject.TypeModule;
private import gobject.ObjectG;
private import gobject.Enums;
private import gobject.Flags;
private import gobject.Boxed;
private import gobject.ParamSpec;
private import gobject.Signals;
private import gobject.Closure;
private import gobject.CClosure;
private import gobject.ValueArray;

private import cairoLib.Pattern;
private import cairoLib.FontFace;
private import cairoLib.ScaledFont;
private import cairoLib.FontOption;
private import cairoLib.Matrix;
private import cairoLib.Status;
private import cairoLib.Version;
private import cairoLib.Types;

private import pango.PgContext;
private import pango.PgItem;
private import pango.PgGlyphString;
private import pango.PgFontDescription;
private import pango.PgFontMetrics;
private import pango.PgFontFamily;
private import pango.PgFontFace;
private import pango.PgFontMap;
private import pango.PgFontsetSimple;
private import pango.PgAttribute;
private import pango.PgAttributeList;
private import pango.PgLanguage;
private import pango.PgTabArray;
private import pango.PgLayout;
private import pango.PgLayoutIter;
private import pango.PgScriptIter;
private import pango.PgCoverage;
private import pango.PgEngine;
private import pango.PgEngineLang;
private import pango.PgEngineShape;

private import atk.Action;
private import atk.Component;
private import atk.Document;
private import atk.EditableText;
private import atk.GObjectAccessible;
private import atk.Hyperlink;
private import atk.Hypertext;
private import atk.Image;
private import atk.NoOpObject;
private import atk.NoOpObjectFactory;
private import atk.ObjectAtk;
private import atk.ObjectFactory;
private import atk.Registry;
private import atk.Relation;
private import atk.RelationSet;
private import atk.Selection;
private import atk.State;
private import atk.StateSet;
private import atk.StreamableContent;
private import atk.Table;
private import atk.Text;
private import atk.Util;
private import atk.ValueAtk;

private import gdkpixbuf.Pixdata;
private import gdkpixbuf.PixbufAnimation;
private import gdkpixbuf.PixbufLoader;

private import gdk.Gdk;
private import gdk.Display;
private import gdk.DisplayManager;
private import gdk.Screen;
private import gdk.Rectangle;
private import gdk.Region;
private import gdk.GC;
private import gdk.Drawable;
private import gdk.Pixmap;
private import gdk.Bitmap;
private import gdk.RGB;
private import gdk.ImageGdk;
private import gdk.Colormap;
private import gdk.Color;
private import gdk.Visual;
private import gdk.Font;
private import gdk.Cursor;
private import gdk.Window;
private import gdk.Event;
private import gdk.EventStruct;
private import gdk.Keymap;
private import gdk.Selection;
private import gdk.DragContext;
private import gdk.Threads;
private import gdk.Input;
private import gdk.Device;

private import gtk.GtkD;
private import gtk.Timeout;
private import gtk.Idle;
private import gtk.AccelGroup;
private import gtk.AccelMap;
private import gtk.Clipboard;
private import gtk.DragAndDrop;
private import gtk.IconTheme;
private import gtk.IconInfo;
private import gtk.StockItem;
private import gtk.IconSource;
private import gtk.RcStyle;
private import gtk.Settings;
private import gtk.BindingSet;
private import gtk.StandardEnumerations;
private import gtk.GCs;
private import gtk.Style;
private import gtk.Selections;
private import gtk.Version;
private import gtk.Signals;
private import gtk.Types;
private import gtk.Dialog;
private import gtk.Invisible;
private import gtk.MessageDialog;
private import gtk.PopupBox;
private import gtk.Window;
private import gtk.MainWindow;
private import gtk.WindowGroup;
private import gtk.AboutDialog;
private import gtk.Assistant;
private import gtk.AccelLabel;
private import gtk.Image;
private import gtk.Label;
private import gtk.ProgressBar;
private import gtk.Statusbar;
private import gtk.StatusIcon;
private import gtk.Button;
private import gtk.CheckButton;
private import gtk.RadioButton;
private import gtk.ToggleButton;
private import gtk.LinkButton;
private import gtk.ScaleButton;
private import gtk.VolumeButton;
private import gtk.Entry;
private import gtk.EntryCompletion;
private import gtk.HScale;
private import gtk.VScale;
private import gtk.SpinButton;
private import gtk.Editable;
private import gtk.TextIter;
private import gtk.TextMark;
private import gtk.TextBuffer;
private import gtk.TextTag;
private import gtk.TextAttributes;
private import gtk.TextTagTable;
private import gtk.TextView;
private import gtk.TextChildAnchor;
private import gtk.TreeModel;
private import gtk.TreeIter;
private import gtk.TreePath;
private import gtk.TreeRowReference;
private import gtk.TreeIterError;
private import gtk.TreeSelection;
private import gtk.TreeViewColumn;
private import gtk.TreeView;
private import gtk.TreeDragSource;
private import gtk.CellView;
private import gtk.IconView;
private import gtk.TreeSortable;
private import gtk.TreeModelSort;
private import gtk.TreeModelFilter;
private import gtk.CellLayoutIF;
private import gtk.CellLayoutT;
private import gtk.CellRenderer;
private import gtk.CellEditable;
private import gtk.CellRendererAccel;
private import gtk.CellRendererCombo;
private import gtk.CellRendererPixbuf;
private import gtk.CellRendererProgress;
private import gtk.CellRendererSpin;
private import gtk.CellRendererText;
private import gtk.CellRendererToggle;
private import gtk.TreeNode;
private import gtk.ListStore;
private import gtk.TreeStore;
private import gtk.ComboBox;
private import gtk.ComboBoxEntry;
private import gtk.Menu;
private import gtk.MenuBar;
private import gtk.MenuItem;
private import gtk.ImageMenuItem;
private import gtk.RadioMenuItem;
private import gtk.CheckMenuItem;
private import gtk.SeparatorMenuItem;
private import gtk.TearoffMenuItem;
private import gtk.Toolbar;
private import gtk.ToolItem;
private import gtk.SeparatorToolItem;
private import gtk.ToolButton;
private import gtk.MenuToolButton;
private import gtk.ToggleToolButton;
private import gtk.RadioToolButton;
private import gtk.UIManager;
private import gtk.ActionGroup;
private import gtk.Action;
private import gtk.ToggleAction;
private import gtk.RadioAction;
private import gtk.RecentAction;
private import gtk.ColorButton;
private import gtk.ColorSelection;
private import gtk.ColorSelectionDialog;
private import gtk.FileChooser;
private import gtk.FileChooserButton;
private import gtk.FileChooserDialog;
private import gtk.FileChooserWidget;
private import gtk.FileFilter;
private import gtk.FontButton;
private import gtk.FontSelection;
private import gtk.FontSelectionDialog;
private import gtk.InputDialog;
private import gtk.Alignment;
private import gtk.AspectFrame;
private import gtk.HBox;
private import gtk.VBox;
private import gtk.HButtonBox;
private import gtk.VButtonBox;
private import gtk.Fixed;
private import gtk.HPaned;
private import gtk.VPaned;
private import gtk.Layout;
private import gtk.Notebook;
private import gtk.Table;
private import gtk.Expander;
private import gtk.Frame;
private import gtk.HSeparator;
private import gtk.VSeparator;
private import gtk.HScrollbar;
private import gtk.VScrollbar;
private import gtk.ScrolledWindow;
private import gtk.PrintOperation;
private import gtk.PrintOperationPreviewIF;
private import gtk.PrintOperationPreviewT;
private import gtk.PrintContext;
private import gtk.PrintSettings;
private import gtk.PageSetup;
private import gtk.PaperSize;
private import gtk.Printer;
private import gtk.PrintJob;
private import gtk.PrintUnixDialog;
private import gtk.PageSetupUnixDialog;
private import gtk.Adjustment;
private import gtk.Arrow;
private import gtk.Calendar;
private import gtk.DrawingArea;
private import gtk.EventBox;
private import gtk.HandleBox;
private import gtk.IMContextSimple;
private import gtk.IMMulticontext;
private import gtk.SizeGroup;
private import gtk.Tooltip;
private import gtk.Viewport;
private import gtk.Accessible;
private import gtk.Bin;
private import gtk.Box;
private import gtk.ButtonBox;
private import gtk.Container;
private import gtk.Item;
private import gtk.MenuShell;
private import gtk.Misc;
private import gtk.ObjectGtk;
private import gtk.Paned;
private import gtk.Range;
private import gtk.Scale;
private import gtk.Scrollbar;
private import gtk.Separator;
private import gtk.Widget;
private import gtk.IMContext;
private import gtk.Plug;
private import gtk.Socket;
private import gtk.Curve;
private import gtk.GammaCurve;
private import gtk.Ruler;
private import gtk.HRuler;
private import gtk.VRuler;
private import gtk.RecentManager;
private import gtk.RecentInfo;
private import gtk.RecentChooserIF;
private import gtk.RecentChooserT;
private import gtk.RecentChooserDialog;
private import gtk.RecentChooserMenu;
private import gtk.RecentChooserWidget;
private import gtk.RecentFilter;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Builder;
private import gtk.FileSelection;
private import gtk.ItemFactory;
private import gtk.Tooltips;
private import gtk.Progress;

private import glgdk.GLdInit;
private import glgdk.GLQuery;
private import glgdk.GLConfig;
private import glgdk.GLContext;
private import glgdk.GLDrawable;
private import glgdk.GLPixmap;
private import glgdk.GLWindow;
private import glgdk.GLFont;
private import glgdk.GLDraw;
private import glgdk.GLTokens;
private import glgdk.GLdVersion;

private import glgtk.GLtInit;
private import glgtk.GLWidget;
private import glgtk.GLtVersion;
private import glgtk.GLCapability;

private import lib.paths.d;
private import lib.Loader.d;
private import lib.glib;
private import lib.gthread;
private import lib.gobject;
private import lib.cairoLib;
private import lib.pango;
private import lib.atk;
private import lib.gdkpixbuf;
private import lib.gdk;
private import lib.gtk;
private import lib.glgdk;
private import lib.glgtk;
