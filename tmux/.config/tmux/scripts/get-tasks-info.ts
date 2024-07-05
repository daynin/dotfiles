import { getTasks } from './utils'

const tasks = await getTasks()
const lastTask = `#[fg=#a6d189,bold,bg=#2D353B]  #[fg=#D3C6AA,bold,bg=#2D353B]${tasks[0].description}`
const tasksCount = `#[fg=#e5c890,bold,bg=#2D353B]  ${tasks.length}`

console.log(`${lastTask} ${tasksCount}`)
