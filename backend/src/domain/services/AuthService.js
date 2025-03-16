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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthService = void 0;
const User_1 = require("../../data/models/User");
const bcryptjs_1 = __importDefault(require("bcryptjs"));
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
class AuthService {
    register(name, email, password) {
        return __awaiter(this, void 0, void 0, function* () {
            const existingUser = yield User_1.UserModel.findOne({ email });
            if (existingUser)
                throw new Error('User already exists');
            const hashedPassword = yield bcryptjs_1.default.hash(password, 10);
            const newUser = yield User_1.UserModel.create({ name, email, password: hashedPassword });
            return this.generateToken(newUser._id.toString());
        });
    }
    login(email, password) {
        return __awaiter(this, void 0, void 0, function* () {
            const user = yield User_1.UserModel.findOne({ email });
            if (!user)
                throw new Error('Invalid credentials');
            const isMatch = yield bcryptjs_1.default.compare(password, user.password);
            if (!isMatch)
                throw new Error('Invalid credentials');
            return this.generateToken(user._id.toString());
        });
    }
    generateToken(userId) {
        return jsonwebtoken_1.default.sign({ userId }, process.env.JWT_SECRET, { expiresIn: '1h' });
    }
}
exports.AuthService = AuthService;
