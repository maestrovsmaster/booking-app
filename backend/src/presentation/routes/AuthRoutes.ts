import { Router } from 'express';
import { AuthService } from '../../domain/services/AuthService';

const router = Router();
const authService = new AuthService();

router.post('/register', async (req, res) => {
    try {
        const token = await authService.register(req.body.name, req.body.email, req.body.password);
        res.json({ token });
    } catch (err: unknown) { 
        if (err instanceof Error) { 
            res.status(400).json({ error: err.message });
        } else {
            res.status(400).json({ error: "An unknown error occurred" });
        }
    }
});

router.post('/login', async (req, res) => {
    try {
        const token = await authService.login(req.body.email, req.body.password);
        res.json({ token });
    } catch (err: unknown) { 
        if (err instanceof Error) { 
            res.status(400).json({ error: err.message });
        } else {
            res.status(400).json({ error: "An unknown error occurred" });
        }
    }
});

export { router as authRoutes };
