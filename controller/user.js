import connection from "../database.js"


export const selectStudent = async (req, res) => {
    try{
        const sql = `SELECT * FROM user WHERE role='student'`;
        connection.query(sql,(error,results,fields) => {
            if(error){
                console.error('Error registering user: ' + error.stack);
                return res.status(500).json({ error: 'An error occurred while registering user' });
            }
            return res.status(200).json({message:'success', results})
        })
    }catch(e){
        console.error('Internal server: ' + error.stack);
        return res.status(500).json({ error: 'Internal server' });
    }
}



export const searchStudent = async (req, res) => {
    const { name } = req.body
    console.log(name)
    try{
        const sql = `SELECT * FROM user WHERE full_name LIKE '%${name}%'`
        connection.query(sql,(error,results,fields) => {
            if(error){
                console.error('Error:'+ error.stack)
                return res.status(500).json({error: 'error'})
            }
            return res.status(200).json({"message":"success", results})
        })
    }catch(e){
        console.error('Internal server: ' + error.stack);
        return res.status(500).json({ error: 'Internal server' });
    }
}