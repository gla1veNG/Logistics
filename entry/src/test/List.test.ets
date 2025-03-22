import StartTest from './Start.test'
import localUnitTest from './LocalUnit.test';

export default function testsuite() {
  localUnitTest();
  StartTest()
}