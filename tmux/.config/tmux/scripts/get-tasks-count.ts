import { $ } from 'bun';

const tasks = await $`task export list`.json();

console.log(`#[fg=#e5c890,bold,bg=#303446]  ${tasks.length}`);
