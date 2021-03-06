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


module gio.SocketConnectableIF;

private import gio.SocketAddressEnumerator;
private import gobject.ObjectG;
private import gtkc.gio;
public  import gtkc.giotypes;


/**
 * Objects that describe one or more potential socket endpoints
 * implement #GSocketConnectable. Callers can then use
 * g_socket_connectable_enumerate() to get a #GSocketAddressEnumerator
 * to try out each socket address in turn until one succeeds, as shown
 * in the sample code below.
 * 
 * |[<!-- language="C" -->
 * MyConnectionType *
 * connect_to_host (const char    *hostname,
 * guint16        port,
 * GCancellable  *cancellable,
 * GError       **error)
 * {
 * MyConnection *conn = NULL;
 * GSocketConnectable *addr;
 * GSocketAddressEnumerator *enumerator;
 * GSocketAddress *sockaddr;
 * GError *conn_error = NULL;
 * 
 * addr = g_network_address_new (hostname, port);
 * enumerator = g_socket_connectable_enumerate (addr);
 * g_object_unref (addr);
 * 
 * // Try each sockaddr until we succeed. Record the first connection error,
 * // but not any further ones (since they'll probably be basically the same
 * // as the first).
 * while (!conn && (sockaddr = g_socket_address_enumerator_next (enumerator, cancellable, error))
 * {
 * conn = connect_to_sockaddr (sockaddr, conn_error ? NULL : &conn_error);
 * g_object_unref (sockaddr);
 * }
 * g_object_unref (enumerator);
 * 
 * if (conn)
 * {
 * if (conn_error)
 * {
 * // We couldn't connect to the first address, but we succeeded
 * // in connecting to a later address.
 * g_error_free (conn_error);
 * }
 * return conn;
 * }
 * else if (error)
 * {
 * /// Either initial lookup failed, or else the caller cancelled us.
 * if (conn_error)
 * g_error_free (conn_error);
 * return NULL;
 * }
 * else
 * {
 * g_error_propagate (error, conn_error);
 * return NULL;
 * }
 * }
 * ]|
 */
public interface SocketConnectableIF{
	/** Get the main Gtk struct */
	public GSocketConnectable* getSocketConnectableStruct();

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/**
	 * Creates a #GSocketAddressEnumerator for @connectable.
	 *
	 * Return: a new #GSocketAddressEnumerator.
	 *
	 * Since: 2.22
	 */
	public SocketAddressEnumerator enumerate();

	/**
	 * Creates a #GSocketAddressEnumerator for @connectable that will
	 * return #GProxyAddresses for addresses that you must connect
	 * to via a proxy.
	 *
	 * If @connectable does not implement
	 * g_socket_connectable_proxy_enumerate(), this will fall back to
	 * calling g_socket_connectable_enumerate().
	 *
	 * Return: a new #GSocketAddressEnumerator.
	 *
	 * Since: 2.26
	 */
	public SocketAddressEnumerator proxyEnumerate();
}
