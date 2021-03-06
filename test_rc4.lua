-- Copyright (c) 2015  Phil Leblanc  -- see LICENSE file

------------------------------------------------------------
-- base64 tests

local rc4 = require 'rc4'

local function test_rc4()
	local k = ('1'):rep(16)
	local plain = 'abcdef'
	local encr = rc4.encrypt(k, plain)
	assert(encr == "\x25\x98\xfa\xe1\x4d\x66")
	encr = rc4.encrypt(k, plain, 0) -- "raw", no drop
	assert(encr == "\x01\x78\xa1\x09\xf2\x21")
	plain = plain:rep(100)
	assert(plain == rc4.encrypt(k, rc4.decrypt(k, plain)))
end


test_rc4()

print("test_rc4: ok")
