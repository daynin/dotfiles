import { $ } from 'bun';

const tasks = await $`task export list`.json();
const mostImportantTask = tasks.sort((task2, task1) => task1.urgency - task2.urgency)[0];

console.log(`#[fg=#a6d189,bold,bg=#303446]   #[fg=#c6d0f5,bold,bg=#303446]${mostImportantTask.description}`);
