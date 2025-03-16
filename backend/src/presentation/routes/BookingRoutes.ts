import { Router } from 'express';
import { BookingModel } from '../../data/models/Booking';

const router = Router();

router.post('/', async (req, res) => {
    const booking = await BookingModel.create(req.body);
    res.status(201).json(booking);
});

export { router as bookingRoutes };
