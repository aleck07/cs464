'use client';
import { useState, useEffect, use } from 'react';
import { Box, Button, Typography } from '@mui/material';
import { Dataset, DatasetItem } from '@/types/data';
import DatasetHeader from '@/components/DatasetHeader';
import FeedbackAlert from '@/components/FeedbackAlert';
import DraggableDatasetItems from '@/components/DraggableDatasetItems';

export default function PuzzlePage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = use(params);
  const [dataset, setDataset] = useState<Dataset | null>(null);
  const [notFound, setNotFound] = useState(false);
  const [shuffledItems, setShuffledItems] = useState<DatasetItem[]>([]);
  const [feedback, setFeedback] = useState<{
    severity: 'success' | 'info';
    message: string;
  } | null>(null);

  useEffect(() => {
    fetch(`/api/data?name=${slug}`)
      .then((r) => r.json())
      .then((data) => {
        if (!data || !data.items) { setNotFound(true); return; }
        setDataset(data);
      });
  }, [slug]);

  useEffect(() => {
    if (dataset) {
      setShuffledItems([...dataset.items].sort(() => Math.random() - 0.5));
      setFeedback(null);
    }
  }, [dataset]);

  const handleCheckOrder = () => {
    if (!dataset) return;
    const correct = shuffledItems.reduce((n, item, i) =>
      item.name === dataset.items[i].name ? n + 1 : n, 0);
    setFeedback(correct === dataset.items.length
      ? { severity: 'success', message: 'Correct! You solved the puzzle.' }
      : { severity: 'info', message: `${correct} of ${dataset.items.length} items are in the correct position.` });
  };

  if (notFound) return (
    <Box sx={{ maxWidth: 600, mx: 'auto', mt: 4, px: 2, textAlign: 'center' }}>
      <Typography>Puzzle not found.</Typography>
    </Box>
  );

  return (
    <Box sx={{ maxWidth: 600, mx: 'auto', mt: 4, px: 2 }}>
      <Button variant="contained" onClick={handleCheckOrder} sx={{ mb: 2 }}>
        Check Order
      </Button>
      <FeedbackAlert feedback={feedback} />
      <DatasetHeader dataset={dataset} />
      <DraggableDatasetItems
        shuffledItems={shuffledItems}
        onReorder={(newOrder) => { setShuffledItems(newOrder); setFeedback(null); }}
        getItemStatus={(item, index) => {
          if (!feedback) return 'default';
          const diff = Math.abs(item.order - (index + 1));
          return diff === 0 ? 'correct' : diff <= 2 ? 'close' : 'wrong';
        }}
      />
    </Box>
  );
}
