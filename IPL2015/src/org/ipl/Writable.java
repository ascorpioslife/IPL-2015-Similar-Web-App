/*
 * The Writable Interface contains methods which need to be implemented by a 
 * class if it directly affects a table in database.
 */

package org.ipl;

import org.ipl.exception.InvalidObjectException;

/**
 * writeToDB() method is implemented by those classes which write valid objects
 * directly to the database. In case of an invalid object write, like SQLException,
 * this method will throw an InvalidObjectException.
 * 
 * @author parishkrit, nikunj
 */
public interface Writable {
    boolean writeToDB() throws InvalidObjectException;
}
