const express = require('express');
const commentCtrl = require('../Controllers/commentControllers');
const {auth }= require('../Middelewers/token_validation');
const router = express.Router();

// message

router.post('/:messageId', auth, commentCtrl.createComment);
router.get('/:messageId', auth,  commentCtrl.getAllComment);
router.put('/:id', auth,  commentCtrl.updateOneComment);
router.delete('/:id',auth,  commentCtrl.deleteOneComment);




module.exports = router;