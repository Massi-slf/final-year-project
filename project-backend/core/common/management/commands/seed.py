from django.core.management.base import BaseCommand, CommandParser
from faker import Faker
from users.models import CustomUser as User
from clients.models import ClientProfile
from sellers.models import SellerProfile
from django.utils.text import slugify
import random

class Command(BaseCommand):
    help = "Seeds users with fake data"

    def add_arguments(self, parser: CommandParser) -> None:
        parser.add_argument(
            '--count',
            type=int,
            default=10,
            help="Number of user records to create",
        )

    def seed_users(self, count: int):
        faker = Faker()

        for _ in range(count):
            # Create a unique email and a sanitized username
            email = faker.email()
            username = slugify(faker.name())
            is_active = random.choice([True,False])
            user_type =   random.choice([User.UserTypesChoices.SELLER,User.UserTypesChoices.CLIENT])

            user = User.objects.create(
                email=email,
                username=username,
                user_type=user_type,
                is_active =is_active
            )
            # if user_type == User.UserTypesChoices.SELLER:
            #     print('creted  seller ')
            #     SellerProfile.objects.create(user=user)
            # else :
            #     print('creted  client ')
            #     ClientProfile.objects.create(user=user)

            # Setting a default password (consider making it changeable after first login)
            user.set_password("SecurePass123!")  # Be cautious with default passwords
            user.save()

            self.stdout.write(self.style.SUCCESS(f'Successfully created user with email: {email} {user_type}'))

    def handle(self, *args, **kwargs):
        count = kwargs.get("count", 10)
        self.seed_users(count)
        self.stdout.write(self.style.SUCCESS(f'Successfully created {count} user records'))
