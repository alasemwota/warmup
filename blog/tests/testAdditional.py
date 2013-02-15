import unittest
import os
import testLib

class TestAdditional(testLib.RestTestCase):
    """Testing Additional Cases"""
    def assertResponse(self, respData, count = 1, errCode = testLib.RestTestCase.SUCCESS):
        """
        Check that the response data dictionary matches the expected values
        """
        expected = { 'errCode' : errCode }
        if count is not None:
            expected['count']  = count
        self.assertDictEqual(expected, respData)

    def testLoginNonUser(self):
        respData = self.makeRequest("/users/login", method="POST", data = { 'user' : 'NonUser000', 'password' : 'PASS0'} )
        self.assertResponse(respData, count = None, errCode = testLib.RestTestCase.ERR_BAD_CREDENTIALS)

    def testAddUserWithoutPassword(self):
	respData = self.makeRequest("/users/add", method="POST", data = { 'user' : 'user1', 'password' : ''} )
        self.assertResponse(respData, count = 1)

    def testAddUserAlreadyAdded(self):
	self.makeRequest("/users/add", method="POST", data = { 'user' : 'user1', 'password' : 'pass1'} )
	respData = self.makeRequest("/users/add", method="POST", data = { 'user' : 'user1', 'password' : 'pass1'} )
        self.assertResponse(respData, None, errCode = testLib.RestTestCase.ERR_USER_EXISTS)

    def testAddBadUsername(self):
	respData = self.makeRequest("/users/add", method="POST", data = { 'user' : '', 'password' : 'PASS0'} )
        self.assertResponse(respData, None, errCode = testLib.RestTestCase.ERR_BAD_USERNAME)

    def testAddBadPassword(self):
	respData = self.makeRequest("/users/add", method="POST", data = { 'user' : 'user0', 'password' : 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'} )
        self.assertResponse(respData, None, errCode = testLib.RestTestCase.ERR_BAD_PASSWORD)

    def testLoginAddedUser(self):
	self.makeRequest("/users/add", method="POST", data = { 'user' : 'user2', 'password' : 'pass2'} )
	respData = self.makeRequest("/users/login", method="POST", data = { 'user' : 'user2', 'password' : 'pass2'} )
        self.assertResponse(respData, count = 2)

		
