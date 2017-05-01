export default () => {
  const audio = document.getElementsByTagName('audio');

  Array.prototype.map.call(audio, player => {
    player.parentNode.removeChild(player);
  });
};
