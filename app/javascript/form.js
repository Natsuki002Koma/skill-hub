function formAction() {
  const addUserButton = document.getElementById('addUserButton');
  const userSelect = document.getElementById('userSelect');
  addUserButton.addEventListener('click', () => {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', '/users'); // サーバーからユーザー情報を取得するエンドポイント
    xhr.onload = function() {
      if (xhr.status === 200) {
        const users = JSON.parse(xhr.responseText); // サーバーからのレスポンスを解析する
        users.forEach(user => {
          const newUserOption = document.createElement('option');
          newUserOption.value = user.id;
          newUserOption.textContent = user.name;
          userSelect.appendChild(newUserOption);
        });
      } else {
        console.error('Failed to load users.');
      }
    };
    xhr.send();
  });
}

document.addEventListener('DOMContentLoaded', formAction);