/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import cpp.Lib;

/**
    @author jxav
 */
@:allow(preferences.Preferences)
class Editor
{
    private static var putIntNative = Lib.load("preferencesios", "putInt", 2);
    private static var putBoolNative = Lib.load("preferencesios", "putBool", 2);
    private static var putFloatNative = Lib.load("preferencesios", "putFloat", 2);
    private static var putStringNative = Lib.load("preferencesios", "putString", 2);
    private static var removeNative = Lib.load("preferencesios", "removeKey", 1);
    private static var synchronizeNative = Lib.load("preferencesios", "synchronize", 0);

    private function new()
    {}

    public function putInt(key: String, value: Int): Bool
    {
        return putIntNative(key, value);
    }

    public function putBool(key: String, value: Bool): Bool
    {
        return putBoolNative(key, value);
    }

    public function putFloat(key: String, value: Float): Bool
    {
        return putFloatNative(key, value);
    }

    public function putString(key: String, value: String): Bool
    {
        return putStringNative(key, value);
    }

    public function remove(key: String): Bool
    {
        return removeNative(key);
    }

    public function apply(): Bool
    {
        return synchronize();
    }

    public function synchronize(): Bool
    {
        return synchronizeNative();
    }
}
