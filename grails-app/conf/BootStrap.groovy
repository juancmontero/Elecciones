import elecciones.SecRole
import elecciones.SecUser
import elecciones.SecUserSecRole
import elecciones.SecRequestmap

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

      def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER',
                                                      descripcionRol: "Rol de usuarios").save(failOnError: true)
      def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN',
                                                      descripcionRol: "Rol de administrator").save(failOnError: true)

      def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
	                username: 'admin',
	                password: springSecurityService.encodePassword('admin'),
	                enabled: true,
                    nombre: "admin",
                    apellidoPaterno: "admin",
                    email: "juanc.montero@gmail.com").save(failOnError: true)

      def simpleUser = SecUser.findByUsername('jc') ?: new SecUser(
	                username: 'jc',
	                password: springSecurityService.encodePassword('jc'),
	                enabled: true,
                    nombre: "Juan",
                    apellidoPaterno: "Montero",
                    email: "juanc.montero@gmail.com").save(failOnError: true)

      if (!adminUser.authorities.contains(adminRole)) {
          SecUserSecRole.create adminUser, adminRole
      }

      if (!adminUser.authorities.contains(userRole)) {
          SecUserSecRole.create adminUser, userRole
      }

      if (!simpleUser.authorities.contains(userRole)) {
          SecUserSecRole.create simpleUser, userRole
      }

      new SecRequestmap(url: '/listaNominal/*', configAttribute: 'ROLE_USER, IS_AUTHENTICATED_FULLY').save()
      new SecRequestmap(url: '/secUser/*', configAttribute: 'ROLE_ADMIN, IS_AUTHENTICATED_FULLY').save()

    }
    def destroy = {
    }
}
