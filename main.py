import vk


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    session = vk.Session(access_token="a581352b328e9c7f6a4edf77193b962e32ad8db6ffc7c95fb55a801318a290f192efbc69801656e83b4c2")  # Начинаем сессию
    vk_api = vk.API(session)
    vk_api.wall.getComments(owner_id=228985481, v=5.126, post_id=1009,
                                 thread_items_count=10)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
