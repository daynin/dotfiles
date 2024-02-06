import { getTasks } from './utils'

const tasks = await getTasks()
const lastTask = `#[fg=#a6d189,bold,bg=#303446]  #[fg=#c6d0f5,bold,bg=#303446]${tasks[0].description}`
const tasksCount = `#[fg=#e5c890,bold,bg=#303446]  ${tasks.length}`

console.log(`${lastTask} ${tasksCount}`)
