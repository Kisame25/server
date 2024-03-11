import express from 'express'
import { selectStudent,searchStudent } from '../controller/user.js'

const router = express.Router()


router.get('/getStudent',selectStudent)
router.post('/search',searchStudent)
export default router