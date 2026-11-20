const express = require('express');
const router = express.Router();

const { getStudents, addStudent, profile } = require('../controller/userController');
const { authenticateToken } = require('../middleware/userMiddleware');

router.get('/', getStudents);
router.post('/', addStudent);
router.get('/profile', authenticateToken, profile);

module.exports = router;