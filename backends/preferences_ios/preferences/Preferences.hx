/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import cpp.Lib;

/**
    @author jxav
 */
class Preferences
{
    private static var getIntNative = Lib.load("preferencesios", "getInt", 1);
    private static var getBoolNative = Lib.load("preferencesios", "getBool", 1);
    private static var getFloatNative = Lib.load("preferencesios", "getFloat", 1);
    private static var getStringNative = Lib.load("preferencesios", "getString", 1);

    public static function getInt(key: String): Int
    {
        return getIntNative(key);
    }

    public static function getBool(key: String): Bool
    {
        return getBoolNative(key);
    }

    public static function getFloat(key: String): Float
    {
        return getFloatNative(key);
    }

    public static function getString(key: String): String
    {
        return getStringNative(key);
    }

    public static function getEditor(): Editor
    {
        return new Editor();
    }
}
