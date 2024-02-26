import {defineConfig} from 'tsup';

export default defineConfig({
  entry: ['src/server.ts'],
  splitting: true,
  sourcemap: true,
  clean: true,
  target: 'es2020',
  minify: true,
});
