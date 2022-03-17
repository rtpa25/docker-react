/** @format */

import { render, screen } from '@testing-library/react';
import App from './App';

test('renders React is awesome link', () => {
  render(<App />);
  const linkElement = screen.getByText(/I was changed on the feature branch/i);
  expect(linkElement).toBeInTheDocument();
});
