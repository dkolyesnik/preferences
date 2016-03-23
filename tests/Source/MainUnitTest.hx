/*
 * Copyright (c) 2003-2016, GameDuell GmbH
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package;

import test.PreferencesTest;
import unittest.TestRunner;
import unittest.implementations.TestHTTPLogger;
import unittest.implementations.TestJUnitLogger;
import unittest.implementations.TestSimpleLogger;

import duellkit.DuellKit;

class MainUnitTest
{
    private var r: TestRunner;

    public function new()
    {
        DuellKit.initialize(startAfterDuellIsInitialized);
    }

    private function startAfterDuellIsInitialized(): Void
    {
        r = new TestRunner(testComplete, DuellKit.instance().onError);
        r.add(new PreferencesTest());

#if test

        #if jenkins
        r.addLogger(new TestHTTPLogger(new TestJUnitLogger()));
        #else
        r.addLogger(new TestHTTPLogger(new TestSimpleLogger()));
        #end

        #else
        r.addLogger(new TestSimpleLogger());
#end

        r.run();
    }

    private function testComplete(): Void
    {
        trace(r.result);
    }

    /// MAIN
    static var _main: MainUnitTest;
    static function main(): Void
    {
        _main = new MainUnitTest();
    }
}
