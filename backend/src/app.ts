//import express, { Request, Response } from 'express';
//import cors from 'cors';
//import dotenv from 'dotenv';
import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import mongoose from 'mongoose';
import { authRoutes } from './presentation/routes/AuthRoutes';
import { serviceRoutes } from './presentation/routes/ServiceRoutes';
import { bookingRoutes } from './presentation/routes/BookingRoutes';





dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/auth', authRoutes);
app.use('/api/services', serviceRoutes);
app.use('/api/bookings', bookingRoutes);

app.get('/', (req, res) => {
    res.send('Backend is running on port 5001');
});


const PORT = process.env.PORT || 5001;
mongoose.connect(process.env.DATABASE_URL!)
    .then(() => {
        console.log('Connected to MongoDB');
        app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
    })
    .catch(err => console.log(err));




