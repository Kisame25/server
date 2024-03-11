import connection from "../database.js"
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';





export const login = async (req, res) => {
    const { email, password } = req.body
    connection.query('SELECT * FROM user WHERE email = ?', [email], async (error, results, fields) => {
        if (error) {
            console.error('Database error', error);
            return res.status(500).json({ message: 'Database error during the login process.' });
        }

        const user = results[0];
        if (!user) {
            return res.status(401).json({ message: 'No user found with this email.' });
        }

        // Check if the password is correct
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(401).json({ message: 'Password is incorrect.' });
        }

        // User is found and password is correct, now create a token
        const token = jwt.sign({ id: user.id }, 'your_jwt_secret', { expiresIn: '1h' }); // Use your secret and set expiration time as needed

        // Set the cookie with the JWT token
        // res.cookie('jwt', token, {
        //     httpOnly: true,
        //     secure: process.env.NODE_ENV === 'production', // set to true if you're on HTTPS
        // });

        // Send the response
        return res.status(203).json({ message: 'success', token});
    })
    connection.end
}

export const register = async (req, res) => {
    const { full_name, email, password, dob, imgaeurl ,role } = req.body;

    

    try {
        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // SQL query to insert a new user into the User table
        const insertQuery = `
            INSERT INTO User (full_name, email, password, dob, imgaeurl , role)
            VALUES (?, ?, ?, ?, ?, ?)
        `;

        // Execute the insert query
        connection.query(insertQuery, [full_name, email, hashedPassword, dob, imgaeurl ,role], (error, results, fields) => {
            if (error) {
                console.error('Error registering user: ' + error.stack);
                return res.status(500).json({ error: 'An error occurred while registering user' });
            }
            return res.status(201).json({ message: 'User registered successfully' });
        });
    } catch (error) {
        console.error('Error hashing password: ' + error.stack);
        return res.status(500).json({ error: 'An error occurred while hashing password' });
    }
}