

const projectsTitle = () => {
  const data = document.querySelector('.project-title')
  if(data) {
  const name = data.dataset.name
  const percent = data.dataset.percent
  document.title = `${percent}% - ${name}`
  }
}

export {projectsTitle};
