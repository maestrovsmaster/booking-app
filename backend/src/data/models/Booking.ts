import mongoose from 'mongoose';

const BookingSchema = new mongoose.Schema({
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    serviceId: { type: mongoose.Schema.Types.ObjectId, ref: 'Service', required: true },
    date: { type: Date, required: true },
    status: { type: String, default: 'pending' }
});

export const BookingModel = mongoose.model('Booking', BookingSchema);
