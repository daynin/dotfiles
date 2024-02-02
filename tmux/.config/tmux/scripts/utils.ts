
import { $ } from 'bun'

export const getTasks = async () => {
  const tasks = await $`task export list`.json()

  return tasks.sort((task2, task1) => task1.urgency - task2.urgency)
}
