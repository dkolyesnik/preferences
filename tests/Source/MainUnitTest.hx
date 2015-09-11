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
