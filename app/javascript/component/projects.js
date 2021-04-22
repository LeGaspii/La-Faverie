

const projectsTitle = () => {
  const data = document.querySelector('.project-title')
  const name = data.dataset.name
  const percent = data.dataset.percent
  document.title = `${name} - ${percent}%`
}


export {projectsTitle};
