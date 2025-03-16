"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.serviceRoutes = void 0;
const express_1 = require("express");
const Service_1 = require("../../data/models/Service");
const router = (0, express_1.Router)();
exports.serviceRoutes = router;
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const services = yield Service_1.ServiceModel.find();
    res.json(services);
}));
router.post('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const newService = yield Service_1.ServiceModel.create(req.body);
    res.status(201).json(newService);
}));
router.delete('/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    yield Service_1.ServiceModel.findByIdAndDelete(req.params.id);
    res.status(204).send();
}));
