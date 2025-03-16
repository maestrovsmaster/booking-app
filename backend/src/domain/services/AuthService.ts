import { UserModel } from '../../data/models/User';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';

export class AuthService {
    async register(name: string, email: string, password: string) {
        const existingUser = await UserModel.findOne({ email });
        if (existingUser) throw new Error('User already exists');

        const hashedPassword = await bcrypt.hash(password, 10);
        const newUser = await UserModel.create({ name, email, password: hashedPassword });

        return this.generateToken(newUser._id.toString());
    }

    async login(email: string, password: string) {
        const user = await UserModel.findOne({ email });
        if (!user) throw new Error('Invalid credentials');

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) throw new Error('Invalid credentials');

        return this.generateToken(user._id.toString());
    }

    private generateToken(userId: string) {
        return jwt.sign({ userId }, process.env.JWT_SECRET!, { expiresIn: '1h' });
    }
}

