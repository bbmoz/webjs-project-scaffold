import test from 'ava'
import helloWorld from './../src/helloWorld'

test('greet with pass message', t => {
  t.plan(1)
  const expectedMsg = 'hello world'
  const msg = helloWorld(expectedMsg)
  t.is(msg, expectedMsg)
})

test('greet with default message', t => {
  t.plan(1)
  const expectedMsg = 'hello world!'
  const msg = helloWorld()
  t.is(msg, expectedMsg)
})
