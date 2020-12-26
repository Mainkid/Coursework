class Web_server_operations:


    @staticmethod
    def check_num(value):
        try:
            int(value)
            return True
        except ValueError:
            return False

    @staticmethod
    def append_query(value):
        Web_server_operations.query.append(value)