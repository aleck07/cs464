'use client';

import { useState, useEffect } from 'react';
import {
  Box, Typography, Card, CardContent, Stack,
  Select, MenuItem, FormControl, InputLabel
} from '@mui/material';
import DragHandleIcon from '@mui/icons-material/DragHandle';

// sample data
import birds from '../../data/bird_population.json';
import fish from '../../data/fish.json';
import planets from '../../data/planets.json';

import { DataFile } from '@/types/data';

function shuffle<T>(arr: T[]): T[] {
  const copy = [...arr];
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [copy[i], copy[j]] = [copy[j], copy[i]];
  }
  return copy;
}

export default function Home() {
  const [selectedIndex, setSelectedIndex] = useState(0);
  const datasets: DataFile[] = [birds, fish, planets];



  const [items, setItems] = useState(datasets[0].items);
  useEffect(() => {
    setItems(shuffle(datasets[0].items));
  }, []);

  const [dragIndex, setDragIndex] = useState<number | null>(null);

  const handleDatasetChange = (index: number) => {
    setSelectedIndex(index);

    setItems(datasets[index].items);

    setTimeout(() => {
      setItems(shuffle(datasets[index].items));
    }, 0);
  };

  const handleDragStart = (index: number) => {
    setDragIndex(index);
  };

  const handleDragOver = (e: React.DragEvent) => {
    e.preventDefault();
  };

  const handleDrop = (index: number) => {
    if (dragIndex === null || dragIndex === index) return;

    const updated = [...items];
    const [moved] = updated.splice(dragIndex, 1);
    updated.splice(index, 0, moved);

    setItems(updated);
    setDragIndex(null);
  };

  const { title, description } = datasets[selectedIndex];

  return (
    <Box sx={{ maxWidth: 600, mx: 'auto', mt: 4, px: 2 }}>

      {/* Dropdown */}
      <FormControl fullWidth sx={{ mb: 3 }}>
        <InputLabel>Select a dataset</InputLabel>
        <Select
          value={selectedIndex}
          label="Select a dataset"
          onChange={(e) => handleDatasetChange(Number(e.target.value))}
        >
          {datasets.map((ds, i) => (
            <MenuItem key={i} value={i}>{ds.title}</MenuItem>
          ))}
        </Select>
      </FormControl>

      {/* Title & description */}
      <Typography variant="h4" gutterBottom>{title}</Typography>
      <Typography variant="body1" color="text.secondary" sx={{ mb: 3 }}>
        {description}
      </Typography>

      {/* Draggable list */}
      <Stack spacing={1}>
        {items.map((item, index) => (
          <Card
            key={item.name}
            variant="outlined"
            draggable
            onDragStart={() => handleDragStart(index)}
            onDragOver={handleDragOver}
            onDrop={() => handleDrop(index)}
            sx={{
              opacity: dragIndex === index ? 0.4 : 1,
              cursor: 'grab'
            }}
          >
            <CardContent
              sx={{
                display: 'flex',
                alignItems: 'center',
                gap: 2,
                py: '12px !important'
              }}
            >
              <DragHandleIcon color="action" />
              <Typography variant="body1">{item.name}</Typography>
            </CardContent>
          </Card>
        ))}
      </Stack>
    </Box>
  );
}
