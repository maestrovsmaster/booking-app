import mongoose from 'mongoose';

const ServiceSchema = new mongoose.Schema({
    name: { type: String, required: true },
    price: { type: Number, required: true },
    description: { type: String },
    available: { type: Boolean, default: true },
});

export const ServiceModel = mongoose.model('Service', ServiceSchema);
