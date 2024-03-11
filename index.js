import express from 'express'; // Correct import statement
import cors from 'cors';
import user from './route/user.js';
import auth from './route/auth.js';

const app = express(); // Correct spelling

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    return res.status(200).json({ message: "success" });
});

app.use('/user', user);
app.use('/auth', auth);

app.listen(3001, () => console.log("app listen on port 3001"));
