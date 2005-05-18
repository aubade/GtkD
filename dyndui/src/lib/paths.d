/*
 * paths.d  -- list of libraries that will be dynamically linked with DUI
 *
 * Added:	John Reimer	-- 2004-12-20
 * Updated: 2005-02-21 changed names; added version(linux)
 * Updated: 2005-05-05 updated Linux support
 */

module lib.paths;

/* 
 * Define the Libraries that DUI will be using.
 *   This is a growable list, as long as the programmer
 *   also adds to the importLibs list.
 */

enum LIBRARY
{
	ATK,
	GDK,
	GDK_PIXBUF,
	GLIB,
	GMODULE,
	GOBJECT,
	GTHREAD,
	GTK,
	PANGO,
	GTK_GLEXT,
	GDK_GLEXT,
	GL,
	GLU
}

version (Windows)
{
const char[][LIBRARY.max+1] importLibs = 
	[
	LIBRARY.ATK:		"libatk-1.0-0.dll",
	LIBRARY.GDK: 		"libgdk-win32-2.0-0.dll",
	LIBRARY.GDK_PIXBUF:	"libgdk_pixbuf-2.0-0.dll",
	LIBRARY.GLIB: 		"libglib-2.0-0.dll",
	LIBRARY.GMODULE: 	"libgmodule-2.0-0.dll",
	LIBRARY.GOBJECT:	"libgobject-2.0-0.dll",
	LIBRARY.GTHREAD:	"libgthread-2.0-0.dll",
	LIBRARY.GTK:		"libgtk-win32-2.0-0.dll",
	LIBRARY.PANGO:		"libpango-1.0-0.dll",
	LIBRARY.GTK_GLEXT:	"libgtkglext-win32-1.0-0.dll",
	LIBRARY.GDK_GLEXT:	"libgdkglext-win32-1.0-0.dll",
	LIBRARY.GL:			"opengl32.dll",
	LIBRARY.GLU:		"glu32.dll"
	];
}

version(linux) 
{
const char[][LIBRARY.max+1] importLibs =
	[
	LIBRARY.ATK:		"libatk-1.0.so",
	LIBRARY.GDK:		"libgdk-x11-2.0.so",
	LIBRARY.GDK_PIXBUF: "libgdk_pixbuf-2.0.so",
	LIBRARY.GLIB:		"libglib-2.0.so",
	LIBRARY.GMODULE:	"libgmodule-2.0.so",
	LIBRARY.GOBJECT:	"libgobject-2.0.so",
	LIBRARY.GTHREAD:	"libgthread-2.0.so",
	LIBRARY.GTK:		"libgtk-x11-2.0.so",
	LIBRARY.PANGO:		"libpango-1.0.so",
	LIBRARY.GTK_GLEXT:	"libgtkglext-x11-1.0.so",
	LIBRARY.GDK_GLEXT:  "libgdkglext-x11-1.0.so",
	LIBRARY.GL:			"libGL.so",
	LIBRARY.GLU:		"libGLU.so"
	];
}

// Specify the default path for the DUI dll's

version(Windows) const char[] libPath = r"\Program Files\Common Files\GTK\2.0\bin\";

//   empty for linux because default path is known by ld

version(linux)   const char[] libPath = "";