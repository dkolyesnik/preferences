/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

/**
    Helper class for providing a handy way of retrieving values for keys of the basic types and an editor to write to
    this key/value storage.

    @author jxav
 */
extern class Preferences
{
    /**
        Retrieves an Int for the given `key`. Returns `0` if the key doesn't exist.
     */
    public static function getInt(key: String): Int;
    /**
        Retrieves a Bool for the given `key`. Returns `false` if the key doesn't exist.
     */
    public static function getBool(key: String): Bool;
    /**
        Retrieves a Float for the given `key`. Returns `0.0` if the key doesn't exist.
     */
    public static function getFloat(key: String): Float;
    /**
        Retrieves a String for the given `key`. Returns `null` if the key doesn't exist.
     */
    public static function getString(key: String): String;

    /**
        Retrieves an `Editor` instance where the changes should be made and committed to.
     */
    public static function getEditor(): Editor;
}
