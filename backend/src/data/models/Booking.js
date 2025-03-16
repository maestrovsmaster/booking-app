"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.BookingModel = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
const BookingSchema = new mongoose_1.default.Schema({
    userId: { type: mongoose_1.default.Schema.Types.ObjectId, ref: 'User', required: true },
    serviceId: { type: mongoose_1.default.Schema.Types.ObjectId, ref: 'Service', required: true },
    date: { type: Date, required: true },
    status: { type: String, default: 'pending' }
});
exports.BookingModel = mongoose_1.default.model('Booking', BookingSchema);
