/*
 * The exception package consists of all custom exceptions.
 */

package org.ipl.exception;

/**
 * Check writable interface for this exception.
 * @author parishkrit
 */
public class InvalidObjectException extends Exception {

    /**
     * Creates a new instance of <code>InvalidObjectWriteException</code>
     * without detail message.
     */
    public InvalidObjectException() {
    }

    /**
     * Constructs an instance of <code>InvalidObjectWriteException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public InvalidObjectException(String msg) {
        super(msg);
    }
}
