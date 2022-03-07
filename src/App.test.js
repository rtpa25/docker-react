/** @format */

import { render, screen } from '@testing-library/react';
import App from './App';

test('renders React is awesome link', () => {
  render(<App />);
  const linkElement = screen.getByText(/React Is Awesome/i);
  expect(linkElement).toBeInTheDocument();
});
