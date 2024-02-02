import { getTasks } from './utils'

const tasks = await getTasks()

console.log(`#[fg=#a6d189,bold,bg=#303446]  #[fg=#c6d0f5,bold,bg=#303446]${tasks[0].description}`)
