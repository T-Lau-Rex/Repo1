// IMPORTACIONES

import express from 'express'
import morgan from 'morgan';
import cors from 'cors'

import backRoutes from './routes/index.js'
// import usuarios from './routes/usuario.js'

// INICIALIZACIONES
const app = express();

// SETTINGS

// MIDDLEWARES 

app.use(morgan("dev"))
app.use(cors())
app.use(express.json())
app.use('/back', backRoutes)

// RUTAS

// app.use('/', usuarios)

export default app