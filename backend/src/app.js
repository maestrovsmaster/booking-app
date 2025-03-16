"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
//import express, { Request, Response } from 'express';
//import cors from 'cors';
//import dotenv from 'dotenv';
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const dotenv_1 = __importDefault(require("dotenv"));
const mongoose_1 = __importDefault(require("mongoose"));
const AuthRoutes_1 = require("./presentation/routes/AuthRoutes");
const ServiceRoutes_1 = require("./presentation/routes/ServiceRoutes");
const BookingRoutes_1 = require("./presentation/routes/BookingRoutes");
dotenv_1.default.config();
const app = (0, express_1.default)();
app.use((0, cors_1.default)());
app.use(express_1.default.json());
app.use('/api/auth', AuthRoutes_1.authRoutes);
app.use('/api/services', ServiceRoutes_1.serviceRoutes);
app.use('/api/bookings', BookingRoutes_1.bookingRoutes);
const PORT = process.env.PORT || 5001;
mongoose_1.default.connect(process.env.DATABASE_URL)
    .then(() => {
    console.log('Connected to MongoDB');
    app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
})
    .catch(err => console.log(err));
/*app._router.stack.forEach((r: any) => {
    if (r.route && r.route.path) {
        console.log(`${Object.keys(r.route.methods).join(', ').toUpperCase()} ${r.route.path}`);
    }
});*/
