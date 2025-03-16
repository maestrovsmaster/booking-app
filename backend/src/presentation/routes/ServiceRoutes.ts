import { Router } from 'express';
import { ServiceModel } from '../../data/models/Service';

const router = Router();

router.get('/', async (req, res) => {
    const services = await ServiceModel.find();
    res.json(services);
});

router.post('/', async (req, res) => {
    const newService = await ServiceModel.create(req.body);
    res.status(201).json(newService);
});

router.delete('/:id', async (req, res) => {
    await ServiceModel.findByIdAndDelete(req.params.id);
    res.status(204).send();
});

export { router as serviceRoutes };
