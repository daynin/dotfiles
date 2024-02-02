import { getTasks } from './utils'

const tasks = await getTasks()

console.log(`#[fg=#e5c890,bold,bg=#303446]  ${tasks.length}`)
